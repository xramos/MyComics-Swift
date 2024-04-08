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
    
    let localization: CharacterDetailLocalization
    
    @Published public private(set) var character: Character
    @Published var state: State = State.idle
    
    // Cancellables
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init(character: Character) {
        
        self.localization = CharacterDetailLocalization()
        self.character = character
    }
    
    func getCharacterDetail() {
        
        state = .loading
        
        cancellable = GetCharacterDetailUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    self.state = .success
                case .failure(let error):
                    self.state = .failed
                    
                    print("Get character error: \(error)")
                }
                
            }, receiveValue: { (character: Character) in
            
                self.character = character
            })
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
