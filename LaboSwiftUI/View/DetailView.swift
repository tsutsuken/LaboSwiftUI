//
//  DetailView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/30.
//

import SwiftUI

struct DetailView: View {
    var event: Event
    
    var body: some View {
        Text("\(event.title)")
        Text("\(event.startDate)")
        Text("\(event.address)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(event: Event())
    }
}
