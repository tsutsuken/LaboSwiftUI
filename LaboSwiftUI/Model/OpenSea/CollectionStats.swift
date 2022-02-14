//
//  CollectionStats.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/13.
//

import Foundation

struct CollectionStats: Codable {
    var averagePrice: Double
    var numOwners: Int
    var totalSales: Int
    var totalSupply: Int
    var totalVolume: Double
}
