//
//  CharacterImageView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct CharacterImageView: View {
    
    var imageString: String?
    
    init(imageString: String? = nil) {
        self.imageString = imageString
    }
    
    var body: some View {
        
        Group {
            
            if let imageString = imageString, let url = URL(string: imageString) {
                
                AsyncImage(url: url) { phase in
                
                    if let image = phase.image {
                        
                        image.resizable()
                            .aspectRatio(contentMode: .fit)

                    } else if phase.error != nil {
                        
                        Image(systemName: "questionmark.diamond")
                        
                    } else {
                        
                        ProgressView()
                    }
                }
                
            } else {
                
                Image(systemName: "questionmark.diamond")
            }
        }
    }
}

#Preview {
    CharacterImageView(imageString: "")
}
