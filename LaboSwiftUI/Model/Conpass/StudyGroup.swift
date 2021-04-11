//
//  StudyGroup.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/11.
//

import Foundation

struct StudyGroup: Decodable {
    var events: [Event]
}

let mockEventsData: [Event]
    = [Event(id: 1,
             title: "YUMEMI.swift #1 ~WWDC19報告会~",
             eventUrl: "https://yumemi.connpass.com/event/131175/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 2,
             title: "YUMEMI.swift #1 ~WWDC19報告会~ パプリックビューイング @Sapporo",
             eventUrl: "https://yumemi.connpass.com/event/135183/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00:00+09:00",
             address: "北海道札幌市中央区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 3,
             title: "Enjoy SwiftUI vol1",
             eventUrl: "https://yumemi.connpass.com/event/139079/",
             hashTag: "yumemi_swift",
             startDate: "2019-07-31T19:00:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ")
]
