//
//  CollectionsViewModel.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/03/15.
//

import Combine

class CollectionsViewModel: ObservableObject {
    @Published private(set) var loadingState: LoadingState = .idle
    @Published var collections: [Collection] = []
    
    private let collectionRepository: CollectionRepository
    private var disposables = Set<AnyCancellable>()
    
    init(collectionRepository: CollectionRepository = CollectionRepository()) {
        self.collectionRepository = collectionRepository
        
        Task {
            await fetchCollectionData()
        }
    }
    
    func onRetry() async {
        await fetchCollectionData()
    }
    
    func onRefresh() async {
        await fetchCollectionData()
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
