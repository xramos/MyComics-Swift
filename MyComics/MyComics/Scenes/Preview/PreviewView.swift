//
//  PreviewView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct PreviewView: View {
    
    var body: some View {
        
        VStack {
            
            /*LinearGradient(colors: [Colors.primary, Color.secondary],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()*/
            
            Text("My Comics")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
        .appBackground()
    }
}

#Preview {
    PreviewView()
}
