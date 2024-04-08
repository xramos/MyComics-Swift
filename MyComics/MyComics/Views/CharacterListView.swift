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
                
                // Image
                
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .font(.headline)
                    
                    Text(realName)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            
            Divider()
        }
        .padding([.leading, .trailing], Value.padding)
    }
}

#Preview {
    CharacterListView(image: nil,
                      name: "Batman",
                      realName: "Bruce Wayne")
}
