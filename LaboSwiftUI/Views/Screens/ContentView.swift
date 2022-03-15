//
//  ContentView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            CollectionsView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.portrait")
                        Text("Collections")
                    }
                }
            FirstView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("First")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
