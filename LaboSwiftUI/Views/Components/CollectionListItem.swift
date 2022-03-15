//
//  CollectionListItem.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/13.
//

import SwiftUI

struct CollectionListItem: View {
    var collection: Collection
    private var includesContractInfo = false
    
    init(collection: Collection) {
        self.collection = collection
        
        if let primaryAssetContracts = collection.primaryAssetContracts,
           !primaryAssetContracts.isEmpty {
            includesContractInfo = true
        }
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: collection.imageUrl ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 48, maxHeight: 48)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "photo.circle")
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .clipShape(Circle())
            }
            Text("\(collection.name ?? "")")
                .font(.headline)
            if includesContractInfo {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 16, height: 16, alignment: .center)
            }
        }
        .frame(height: 72)
        
    }
}

struct CollectionListItem_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListItem(collection: dev.collection)
            .previewLayout(.sizeThatFits)
    }
}
