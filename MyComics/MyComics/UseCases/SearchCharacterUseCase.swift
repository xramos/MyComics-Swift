//
//  SearchCharacterUseCase.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation
import Combine

class SearchCharacterUseCase {
    
    private let repository: Repository
    
    init(repository: Repository = RepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(value: String) -> AnyPublisher<[Character], Error> {
        
        return repository.searchCharacter(value: value)
    }
}
