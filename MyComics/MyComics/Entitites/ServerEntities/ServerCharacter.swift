//
//  ServerCharacter.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

struct ServerCharacter: Codable {
    
    let id: Int
    let name: String?
    let realName: String?
    let aliases: String?
    let image: ServerImageModel?
    let birth: String?
    let deck: String?
    let gender: Int?
    let origin: ServerOrigin?
    let powers: [ServerPower]?
    
    func converToEntity() -> Character {
        
        let image = image?.convertToEntity()
        
        var pows: [Power] = []
        if let serverPowers = powers {
            pows = serverPowers.map({ $0.convertToEntity()})
        }
        
        var formattedAliases = ""
        if let aliases = aliases {
            formattedAliases = aliases.replacingOccurrences(of: "\n", with: ", ")
        }
        
        return Character(id: id,
                         name: name ?? "",
                         realName: realName ?? "",
                         aliases: formattedAliases,
                         image: image,
                         birth: birth ?? "",
                         deck: deck ?? "",
                         gender: Gender(rawValue: gender ?? 0) ?? .other,
                         origin: origin?.name ?? "",
                         powers: pows)
    }
}
