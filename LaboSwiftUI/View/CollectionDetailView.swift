//
//  CollectionDetailView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/13.
//

import SwiftUI

struct CollectionDetailView: View {
    var collection: Collection
    
    var body: some View {
        VStack {
            Text("name: \(collection.name ?? "")")
            Text("imageUrl: \(collection.imageUrl ?? "")")
        }
    }
}

struct CollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionDetailView(collection: Collection())
    }
}
