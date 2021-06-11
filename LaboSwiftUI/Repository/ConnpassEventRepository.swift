//
//  ConnpassEventRepository.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/05/01.
//

import Foundation
import Combine

protocol ConnpassEventRepositoryProtocol {}

class ConnpassEventRepository: ConnpassEventRepositoryProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
      self.session = session
    }
    
    func fetchEventData() -> AnyPublisher<StudyGroup, APIError> {
      return fetchData(with: URLComponents(string: "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift")!)
    }
    
    func fetchData<T>(with components: URLComponents) -> AnyPublisher<T, APIError> where T: Decodable {
      guard let url = components.url else {
        let error = APIError(NSError(domain: "", code: 401, userInfo: nil))
        return Fail(error: error).eraseToAnyPublisher()
      }

      return session.dataTaskPublisher(for: URLRequest(url: url))
        .mapError { error in
          .networkError(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
          decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
}
