//
//  GetCharacterDetailUseCase.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation
import Combine

class GetCharacterDetailUseCase {
    
    private let repository: Repository
    
    init(repository: Repository = RepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Character, Error> {
        
        return repository.getCharacter(id: id)
    }
}
