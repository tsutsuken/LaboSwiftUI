//
//  PreviewProvider.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/03/15.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    private init() {}
    
    let collection = Collection(
        name: "CryptoPunks",
        imageUrl: "https://lh3.googleusercontent.com/BdxvLseXcfl57BiuQcQYdJ64v-aI8din7WPk0Pgo3qQFhAUH-B6i-dCqqc_mCkRIzULmwzwecnohLhrcH8A9mpWIZqA7ygc52Sr81hE=s130",
        bannerImageUrl: "https://lh3.googleusercontent.com/t4yNWGJ4CNeup-qyjzhN6ZoOX6Mv2isFoXwr-92_7cCDUlDJH4s_k_SId_7Ks3fV_VljkYTAie_CiqqFHWrnQIbCKPfoDTjYvilTo8w=s2500",
        description: "CryptoPunks launched as a fixed set of 10,000 items in mid-2017 and became one of the inspirations for the ERC-721 standard. They have been featured in places like The New York Times, Christie’s of London, Art|Basel Miami, and The PBS NewsHour.",
        stats: nil,
        primaryAssetContracts: nil
    )
}
