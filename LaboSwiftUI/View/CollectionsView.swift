//
//  CollectionsView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/12.
//

import SwiftUI
import Combine

class CollectionsViewModel: ObservableObject {
    @Published var collections: [Collection] = []
    
    private let collectionRepository: CollectionRepository
    private var disposables = Set<AnyCancellable>()
    
    init() {
        collectionRepository = CollectionRepository()
    }
    
    func fetchCollectionData() {
        print("fetchCollectionData")
        collectionRepository.fetchCollectionData()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {value in
                    switch value {
                    case .failure(let error):
                        print("fetchCollectionData error: \(error)")
                    case .finished:
                        print("fetchCollectionData finished")
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    self.collections = response.collections
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
            List(viewModel.collections) { collection in
                NavigationLink(destination: CollectionDetailView(collection: collection)) {
                    Text("\(collection.name ?? "")")
                }
            }
            .navigationTitle("Collections")
        }
        .navigationViewStyle(.stack)
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsView()
    }
}
