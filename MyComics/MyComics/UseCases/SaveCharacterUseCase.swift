//
//  SaveCharacterUseCase.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

class SaveCharacterUseCase {
    
    private let repository: Repository
    
    init(repository: Repository = RepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(character: Character) {
        
        repository.saveCharacter(character: character)
    }
}
