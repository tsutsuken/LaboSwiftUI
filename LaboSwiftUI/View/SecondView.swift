//
//  SecondView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/11.
//

import SwiftUI

class SecondViewModel: ObservableObject {
    @Published var eventData: [Event] = []
//    @Published var eventData: [Event] = mockEventsData
    
    // connpass's event search API
    private let urlLink = "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift"

    init() {
        fetchEventData()
    }

    func fetchEventData() {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(StudyGroup.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchedResultData.events.reversed()
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}

struct SecondView: View {
    @ObservedObject var viewModel = SecondViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.eventData) { event in
                Text("\(event.title)")
            }
            .navigationBarTitle(Text("YUMEMI.swift一覧"))
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
