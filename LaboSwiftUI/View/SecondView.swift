//
//  SecondView.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/04/11.
//

import SwiftUI
import Combine

class SecondViewModel: ObservableObject {
    @Published var eventData: [Event] = []
    
    private let connpassEventRepository: ConnpassEventRepository
    private var disposables = Set<AnyCancellable>()

    init() {
        connpassEventRepository = ConnpassEventRepository()
    }
    
    func fetchEventData() {
        connpassEventRepository.fetchEventData()
            .receive(on: DispatchQueue.main)
            .sink(
              receiveCompletion: { value in
                switch value {
                case .failure(let error):
                    print("fetchEventData error: \(error.localizedDescription)")
                case .finished:
                    print("fetchEventData finished")
                }
              },
              receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.eventData = response.events.reversed()
            })
            .store(in: &disposables)
    }
}

struct SecondView: View {
    @ObservedObject var viewModel = SecondViewModel()
    
    init() {
        viewModel.fetchEventData()
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.eventData) { event in
                NavigationLink(destination: DetailView(event: event)) {
                    EventRowView(event: event)
                }
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
