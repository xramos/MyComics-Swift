//
//  FavoritesViewModel.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ObservableObject {
    
    // Values
    
    let localization: FavoritesLocalization
    
    @Published public private(set) var characters: [Character] = []
    
    // MARK: - Methods
    
    init() {
        
        self.localization = FavoritesLocalization()
    }
    
    func getFavoriteCharacters() {
        
        // TODO: Add GetFavoriteCharactersUseCase
    }
}
