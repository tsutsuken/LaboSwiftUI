//
//  APIError.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/05/01.
//

import Foundation

enum APIError: Error {
    case parseError(description: String)
    case networkError(description: String)
    case systemError(Error)
    
    init(_ error: Error) {
        switch error {
        default:
            self = .systemError(error)
        }
    }
}
