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
}
