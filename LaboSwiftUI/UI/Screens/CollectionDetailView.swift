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
            AsyncImage(url: URL(string: collection.imageUrl ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 96, maxHeight: 96)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "photo.circle")
                    .resizable()
                    .frame(width: 96, height: 96, alignment: .center)
                    .clipShape(Circle())
            }
            Text("\(collection.name ?? "")")
                .font(.title)
            Text("\(collection.description ?? "")")
                .font(.caption)
            if let stats = collection.stats {
                Text("\(stats.totalSupply) items")
                    .font(.headline)
                Text("\(stats.numOwners) owners")
                    .font(.headline)
                Text("\(stats.averagePrice) average price")
                    .font(.headline)
                Text("\(stats.totalVolume) traded")
                    .font(.headline)
            }
            if let contracts = collection.primaryAssetContracts, !contracts.isEmpty {
                let firstContract = contracts[0]
                Text("\(firstContract.address)")
                    .font(.headline)
            }
        }
    }
}

struct CollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionDetailView(collection: Collection())
    }
}
