//
//  RemoveCharacterUseCase.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

class RemoveCharacterUseCase {
    
    private let repository: Repository
    
    init(repository: Repository = RepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(character: Character) {
        
        repository.removeCharacter(character: character)
    }
}
