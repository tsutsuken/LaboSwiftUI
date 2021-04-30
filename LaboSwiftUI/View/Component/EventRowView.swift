//
//  EventRowView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/30.
//

import SwiftUI

struct EventRowView: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
            Spacer()
            Text("\(event.startDate)")
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: Event())
    }
}
