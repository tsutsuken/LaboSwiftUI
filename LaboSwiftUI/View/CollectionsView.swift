//
//  CollectionsView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/12.
//

import SwiftUI
import Combine

class CollectionsViewModel: ObservableObject {
    @Published private(set) var loadingState: LoadingState = .idle
    @Published var collections: [Collection] = []
    
    private let collectionRepository: CollectionRepository
    private var disposables = Set<AnyCancellable>()
    
    init() {
        collectionRepository = CollectionRepository()
    }
    
    func fetchCollectionData() {
        print("fetchCollectionData")
        loadingState = .loading
        collectionRepository.fetchCollectionData(ownerAddress: "0xc352b534e8b987e036a93539fd6897f53488e56a")
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure(let error):
                        self.loadingState = .failed(error)
                        print("fetchCollectionData error: \(error)")
                    case .finished:
                        print("fetchCollectionData finished")
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    self.collections = response
                    self.loadingState = .loaded
                    print("fetchCollectionData receiveValue")
                    print("collections: \(self.collections)")
                })
            .store(in: &disposables)
    }
}

struct CollectionsView: View {
    @ObservedObject var viewModel = CollectionsViewModel()
    
    init() {
        viewModel.fetchCollectionData()
    }
    
    var body: some View {
        NavigationView {
            switch viewModel.loadingState {
            case .idle, .loading :
                Text("loading")
            case .failed(let error):
                Text("failed: \(error.localizedDescription)")
            case .loaded:
                List(viewModel.collections) { collection in
                    NavigationLink(destination: CollectionDetailView(collection: collection)) {
                        CollectionListItem(collection: collection)
                    }
                }
                .navigationTitle("Collections")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsView()
    }
}
