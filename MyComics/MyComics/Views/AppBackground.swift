//
//  AppBackground.swift
//  MyComics
//
//  Created by Xavier Ramos on 24/4/24.
//

import SwiftUI

struct AppBackground<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(LinearGradient(colors: [Colors.primary, Colors.secondary],
                                     startPoint: .top,
                                     endPoint: .bottom))
                .ignoresSafeArea()
            
            content
        }
    }
}

struct AppBackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        AppBackground {
            
            content
        }
    }
}

extension View {

    func appBackground() -> some View {
        
        self.modifier(AppBackgroundModifier())
    }
}
