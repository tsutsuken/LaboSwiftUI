//
//  CollectionsView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/12.
//

import SwiftUI

struct CollectionsView: View {
    @StateObject private var viewModel: CollectionsViewModel
    
    init(viewModel: CollectionsViewModel = CollectionsViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
