//
//  ServerPower.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

struct ServerPower: Codable {
    
    let id: Int
    let name: String?
    
    func convertToEntity() -> Power {
        
        return Power(id: id,
                     name: name ?? "")
    }
}
