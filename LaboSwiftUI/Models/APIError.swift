//
//  APIError.swift
//  LaboSwiftUI
//
//  Created by Ken Tsutsumi on 2021/05/01.
//

import Foundation

enum APIError: Error {
    case parseError(Error)
    case networkError(Error)
    case systemError(Error)
    
    init(_ error: Error) {
        switch error {
        default:
            self = .systemError(error)
        }
    }
}
