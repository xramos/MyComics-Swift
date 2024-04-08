//
//  PreviewView.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct PreviewView: View {
    
    var body: some View {
        
        Color.red
            /*.overlay(
                VStack(alignment: .center) {
                    Image("wefoxLogoColor")
                }
            )*/
            .accessibility(hidden: true)
            .ignoresSafeArea()
    }
}

#Preview {
    PreviewView()
}
