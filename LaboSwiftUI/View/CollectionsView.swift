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
        Task.init(priority: .userInitiated, operation: {
            await fetchCollectionData()
        })
    }
    
    @MainActor func fetchCollectionData() async {
        print("fetchCollectionData")
        loadingState = .loading
        
        do {
            let response = try await collectionRepository.fetchCollectionData(ownerAddress: "0xc352b534e8b987e036a93539fd6897f53488e56a")
            
            print("fetchCollectionData response: \(response.count)")
            self.collections = response
            self.loadingState = .loaded
        } catch {
            print("fetchCollectionData error: \(error)")
            self.loadingState = .failed(error)
        }
    }
}

struct CollectionsView: View {
    @ObservedObject var viewModel = CollectionsViewModel()
    
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
