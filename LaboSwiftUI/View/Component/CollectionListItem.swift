//
//  CollectionListItem.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/13.
//

import SwiftUI

struct CollectionListItem: View {
    var collection: Collection
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: collection.imageUrl ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 64, maxHeight: 64)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 64, height: 64, alignment: .center)
            }
            Text("\(collection.name ?? "")")
        }
        
    }
}

struct CollectionListItem_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListItem(collection: Collection())
    }
}
