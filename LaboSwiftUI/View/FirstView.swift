//
//  FirstView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/11.
//

import SwiftUI

class FirstViewModel: ObservableObject {
    @Published var count = 0
    @Published var name = ""
}

struct FirstView: View {
    @ObservedObject var viewModel = FirstViewModel()
    
    var body: some View {
        VStack {
            Text("カウント: \(viewModel.count)")
                .padding(8)
            Button(action: {
                self.viewModel.count += 1
            }) {
                Text("カウントを足す")
            }
            Text("名前: \(viewModel.name)")
                .padding(8)
            TextField("名前", text: $viewModel.name)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
