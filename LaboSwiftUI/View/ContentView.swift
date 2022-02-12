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
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            FirstView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("First")
                    }
            }
            SecondView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Second")
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
