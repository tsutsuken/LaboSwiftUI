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
        }
        .frame(height: 72)
        
    }
}

struct CollectionListItem_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListItem(collection: Collection())
    }
}
