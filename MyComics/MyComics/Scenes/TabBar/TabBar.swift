//
//  TabBar.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: TabItem = TabItem.search
    
    let localization: TabBarLocalization = TabBarLocalization()
    
    init() {
        
        tabBarApperance()
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            SearchView()
                .tabItem {
                    tabView(tabItem: .search)
                }
                .tag(TabItem.search)
            
            FavoritesView()
                .tabItem {
                    tabView(tabItem: .favorites)
                }
                .tag(TabItem.favorites)
        }
        .tint(Color.black)
        .background(Colors.neutral)
        .navigationTitle(getNavBarTitle(for: activeTab))
        .navigationBarTitleDisplayMode(.large)
    }
    
    func getNavBarTitle(for tabItemType: TabItem) -> String {
        
        switch tabItemType {
        case .search:
            return localization.seachTabTitle
        case .favorites:
            return localization.favoritesTabTitle
        }
    }
    
    func tabView(tabItem: TabItem) -> some View {
        
        Group {
            
            Image(systemName: tabItem.iconName)
                .renderingMode(.template)
            
            Text(tabItem.title)
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
