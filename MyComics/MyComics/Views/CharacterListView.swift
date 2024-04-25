//
//  CharacterListView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct CharacterListView: View {
    
    var image: String?
    var name: String
    var realName: String
    
    init(image: String? = nil, name: String, realName: String) {
        self.image = image
        self.name = name
        self.realName = realName
    }

    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: Value.padding) {
                
                CharacterImageView(imageString: image)
                    .frame(width: Value.width, height: Value.height)
                
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .font(.headline)
                    
                    Text(realName)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .background(Colors.neutral)
            .clipShape(RoundedRectangle(cornerRadius: Value.cornerRadius, style: .continuous))
        }
        .padding(.bottom, 5)
    }
}

#Preview {
    CharacterListView(image: nil,
                      name: "Batman",
                      realName: "Bruce Wayne")
}
