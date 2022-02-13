//
//  CollectionRepository.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2022/02/12.
//

import Foundation
import Combine

protocol CollectionRepositoryProtocol {}

class CollectionRepository: CollectionRepositoryProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
      self.session = session
    }
    
    func fetchCollectionData() -> AnyPublisher<CollectionsResponse, APIError> {
        return fetchData(with: URLComponents(string: "https://api.opensea.io/api/v1/collections?offset=0&limit=50")!)
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
        .flatMap(maxPublishers: .max(1)) { output in
          decode(output.data)
        }
        .eraseToAnyPublisher()
    }
}
