//
//  ServerBaseResponse.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

struct ServerBaseResponse<T: Codable>: Codable {

    let results: T
}
