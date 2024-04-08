//
//  CharacterDetailView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    
    let character = Character(id: 1,
                              name: "Batman",
                              realName: "Bruce Wayne",
                              aliases: "", 
                              image: nil,
                              birth: "",
                              deck: "",
                              gender: .male,
                              origin: "",
                              powers: [])
    
    let viewModel = CharacterDetailViewModel(character: character)
    
    return CharacterDetailView(viewModel: viewModel)
}
