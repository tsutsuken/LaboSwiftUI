//
//  Collection.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/12.
//

import Foundation

struct Collection: Decodable, Identifiable {
    let id = UUID()
    var name: String?
    var imageUrl: String?
    var bannerImageUrl: String?
    var description: String?
    var stats: CollectionStats?
}

