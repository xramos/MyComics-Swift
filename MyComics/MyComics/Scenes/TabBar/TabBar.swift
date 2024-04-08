//
//  TabBar.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = Tab.search
    
    let localization: TabBarLocalization = TabBarLocalization()
    
    init() {
        
        tabBarApperance()
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(localization.seachTabTitle)
                }
                .tag(Tab.search)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text(localization.favoritesTabTitle)
                }
                .tag(Tab.favorites)
        }
        .navigationTitle(getNavBarTitle(for: activeTab))
        .navigationBarTitleDisplayMode(.large)
    }
    
    func getNavBarTitle(for tabItemType: Tab) -> String {
        
        switch tabItemType {
        case .search:
            return localization.seachTabTitle
        case .favorites:
            return localization.favoritesTabTitle
        }
    }
}

extension TabBar {
    
    func tabBarApperance() {
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
}

#Preview {
        
    TabBar()
}
