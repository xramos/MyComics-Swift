//
//  MyComicsApp.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import SwiftUI

@main
struct MyComicsApp: App {
    
    @State var inactive = false
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        
        WindowGroup {
            
            ZStack {
                
                TabBar()
                    .opacity(inactive ? 0 : 1)
                
                PreviewView()
                    .opacity(inactive ? 1 : 0)
            }
            
        }.onChange(of: scenePhase) { oldScenePhase, newScenePhase in
            
            switch newScenePhase {
            case .active:
                DispatchQueue.main.async {
                    inactive = false
                }
            case .background, .inactive:
                DispatchQueue.main.async {
                    inactive = true
                }
            @unknown default:
                print("Apple must have added something new!")
            }
        }
    }
}
