//
//  SearchViewModel.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    
    // Variables
    
    let localization: SearchLocalization
    
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    
    // Cancellables
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    init() {
        
        localization = SearchLocalization()
    }
    
    func search(searchInput: String) {
        
        showProgressView = true
        
        cancellable = SearchCharacterUseCase().execute(value: searchInput)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Search error: \(error)")
                }
                
            }, receiveValue: { (characters: [Character]) in
            
                self.characters = characters
            })
    }
    
    func deleteSearchInput() {
        
        characters = []
    }
}
