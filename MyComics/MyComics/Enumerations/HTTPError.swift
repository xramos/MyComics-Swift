//
//  HTTPError.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
