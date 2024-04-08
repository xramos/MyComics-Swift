//
//  Repository.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation
import Combine

protocol Repository {
    
    func searchCharacter(value: String) -> AnyPublisher<[Character], Error>
    
    func getCharacter(id: Int) -> AnyPublisher<Character, Error>
    
    func saveCharacter(character: Character)
    
    func removeCharacter(character: Character)
    
    func existCharacter(character: Character) -> Bool
    
    func getCharacters() -> [Character]
}
