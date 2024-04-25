//
//  FavoritesView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel = FavoritesViewModel()
    
    var body: some View {
       
        VStack {
            
            if viewModel.characters.isEmpty {
                
                Spacer()
                
                Text(viewModel.localization.empty)
                    .font(.body)
                
                Spacer()
                
            } else {
                
                characterListView
            }
            
        }.onAppear {
            
            viewModel.getFavoriteCharacters()
        }
        .appBackground()
    }
    
    @ViewBuilder
    var characterListView: some View {
        
        ScrollView {
            
            ForEach(viewModel.characters) { character in
            
                NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                    
                    CharacterListView(image: character.image?.smallUrl,
                                      name: character.name,
                                      realName: character.realName)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(5)
    }
}

#Preview {
    FavoritesView()
}
