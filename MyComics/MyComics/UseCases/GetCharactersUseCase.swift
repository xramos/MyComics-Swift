//
//  GetCharactersUseCase.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

class GetCharactersUseCase {
    
    private let repository: Repository
    
    init(repository: Repository = RepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Character] {
        
        return repository.getCharacters()
    }
}
