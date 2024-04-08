//
//  CharacterDetailViewModel.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI
import Combine

class CharacterDetailViewModel: ObservableObject {
    
    // Variables
    
    @Published public private(set) var character: Character
    
    // MARK: - Methods
    
    init(character: Character) {
        
        self.character = character
    }
}

extension CharacterDetailViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case failed
        case success
    }
}
