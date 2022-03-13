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

struct CollectionsView: View {
    @StateObject var viewModel = CollectionsViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.loadingState {
            case .idle : VStack {}
            case .failed(let error):
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Text("Failed to load collections: \(error.localizedDescription)")
                            .font(.body)
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Button {
                            Task {
                                await viewModel.onRetry()
                            }
                        } label: {
                            Text("Try again")
                                .foregroundColor(Color(uiColor: .link))
                        }
                    }
                    Spacer()
                }
            case .loading, .loaded:
                List(viewModel.collections) { collection in
                    NavigationLink(destination: CollectionDetailView(collection: collection)) {
                        CollectionListItem(collection: collection)
                    }
                }
                .navigationTitle("Collections")
                .refreshable(action: {
                    await viewModel.onRefresh()
                })
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
