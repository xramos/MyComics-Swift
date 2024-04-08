//
//  DBPower.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

extension DBPower {
    
    func convertToEntity() -> Power {
        
        return Power(id: Int(id),
                     name: name ?? "")
    }
}
