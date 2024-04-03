//
//  RepositoryImplementation.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation
import Combine

class RepositoryImplementation {
    
    private let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource = RemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - Repository

extension RepositoryImplementation: Repository {
    
    func searchCharacter(value: String) -> AnyPublisher<[Character], Error> {
        
        return remoteDataSource.searchCharacter(value: value).map { serverCharacters -> [Character] in
            
            var characters: [Character] = []
            
            for serverCharacter in serverCharacters.results {
                
                // convert to entity
                let character = serverCharacter.converToEntity()
                
                characters.append(character)
            }
            
            // Return
            return characters
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getCharacter(id: Int) -> AnyPublisher<Character, Error> {
        
        return remoteDataSource.getCharacter(id: id).map { serverCharacter -> Character in
            
            // convert to entity
            let character = serverCharacter.results.converToEntity()
            
            // Return
            return character
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
