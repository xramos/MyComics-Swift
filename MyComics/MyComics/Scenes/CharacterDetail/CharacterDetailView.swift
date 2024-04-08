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
        
        VStack {
            
            content
            
        }.onAppear {
            
            viewModel.getCharacterDetail()
        }
    }
}

private extension CharacterDetailView {
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.state {
        case .idle:
            idleView()
        case .loading:
            loadingView()
        case .failed:
            failureView()
        case .success:
            successView()
        }
    }
    
    private func idleView() -> some View {
        
        EmptyView()
    }
    
    private func loadingView() -> some View {
        
        ProgressView()
    }
    
    private func failureView() -> some View {
        
        EmptyView()
    }
    
    private func successView() -> some View {
        
        VStack(alignment: .center) {
            
            headerView
            
            Divider()
            
            detailView
        }
        .padding([.leading, .trailing], Value.paddingLarge)
    }
}

private extension CharacterDetailView {
    
    @ViewBuilder
    var headerView: some View {
        
        HStack(alignment: .center, spacing: Value.spacing) {
            
            CharacterImageView(imageString: viewModel.character.image?.superUrl)
                .frame(width: Value.widthLarge, height: Value.heightLarge)
                .clipShape(RoundedRectangle(cornerRadius: Value.cornerRadius, style: .circular))
            
            VStack(alignment: .leading, spacing: Value.spacing) {
                
                Text(viewModel.character.name)
                    .font(.largeTitle)
                
                Text(viewModel.character.realName)
                    .font(.body)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        
        ScrollView {
            
            if !viewModel.character.birth.isEmpty {
                
                titleView(title: viewModel.localization.birth,
                          value: viewModel.character.birth)
            }
            
            titleView(title: viewModel.localization.gender,
                      value: viewModel.character.getGender())
            
            if !viewModel.character.origin.isEmpty {
                
                titleView(title: viewModel.localization.origin,
                          value: viewModel.character.origin)
            }
            
            if !viewModel.character.aliases.isEmpty {
                
                infoView(title: viewModel.localization.alias,
                         value: viewModel.character.aliases)
            }
            
            if !viewModel.character.getPowers().isEmpty {
                
                infoView(title: viewModel.localization.powers,
                         value: viewModel.character.getPowers())
            }
            
            if !viewModel.character.deck.isEmpty {
                
                infoView(title: viewModel.localization.description,
                         value: viewModel.character.deck)
            }
        }
    }
    
    func titleView(title: String, value: String) -> some View {
        
        Group {
            
            HStack(alignment: .center) {
                
                VStack(alignment: .leading) {
                    
                    Text(title)
                        .font(.headline)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text(value)
                        .font(.body)
                }
            }
            
            Spacer().frame(height: Value.spaceHeight)
        }
    }
    
    func infoView(title: String, value: String) -> some View {
        
        Group {
            
            HStack(alignment: .center) {
                
                VStack(alignment: .leading) {
                    
                    Text(title)
                        .font(.headline)
                    
                    Spacer().frame(height: Value.spaceHeight)
                    
                    Text(value)
                        .font(.body)
                }
                
                Spacer()
            }
            
            Spacer().frame(height: Value.spaceHeight)
        }
    }
}

#Preview {
    
    let character = Character(id: 1,
                              name: "Batman",
                              realName: "Bruce Wayne",
                              aliases: "", 
                              image: nil,
                              birth: "Gotham",
                              deck: "",
                              gender: .male,
                              origin: "",
                              powers: [])
    
    let viewModel = CharacterDetailViewModel(character: character)
    viewModel.state = .success
    
    return CharacterDetailView(viewModel: viewModel)
}
