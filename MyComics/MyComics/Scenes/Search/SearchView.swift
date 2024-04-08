//
//  SearchView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    
    @State var searchText: String = ""
    
    var body: some View {
        
        VStack {
            
            searchCharacterView
            
            Divider()
            
            if viewModel.showProgressView {
                
                ProgressView()
            }
            
            charactersListView
        }
        .padding(.top, Value.padding)
        .padding([.leading, .trailing], Value.paddingLarge)
    }
    
    @ViewBuilder
    var searchCharacterView: some View {
        
        HStack(spacing: Value.padding) {
            
            TextField(viewModel.localization.textLabel, text: $searchText)
            
            if !searchText.isEmpty {
                
                Button(action: {
                    
                    self.searchText = ""
                    viewModel.deleteSearchInput()
                }) {
                    
                    Image(systemName: "delete.left")
                        .foregroundColor(.gray)
                }
            }
            
            Button(viewModel.localization.button) {
                
                if !searchText.isEmpty {
                    
                    viewModel.search(searchInput: searchText)
                }
            }
        }
    }
    
    @ViewBuilder
    var charactersListView: some View {
        
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
    }
}

#Preview {
    SearchView()
}
