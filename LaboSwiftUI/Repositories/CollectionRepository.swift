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
    private let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchCollectionData(ownerAddress: String) async throws -> [Collection] {
        return try await fetchData(with: URLComponents(string: "https://api.opensea.io/api/v1/collections?offset=0&limit=50&asset_owner=\(ownerAddress)")!)
    }
    
    func fetchData<T>(with components: URLComponents) async throws -> T where T: Decodable {
        guard let url = components.url else {
            let error = APIError(NSError(domain: "", code: 401, userInfo: nil))
            throw error
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}
