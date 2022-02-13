//
//  Parsing.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/05/01.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parseError(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
