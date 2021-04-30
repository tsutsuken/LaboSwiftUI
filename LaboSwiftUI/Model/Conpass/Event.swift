//
//  Event.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/11.
//

import Foundation

struct Event: Decodable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var eventUrl: String = ""
    var hashTag: String = ""
    var startDate: String = ""
    var address: String = ""
    var ownerDisplayName: String = ""

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case address = "address"
        case ownerDisplayName = "owner_display_name"
    }
}
