//
//  TabItem.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

enum TabItem: Int, Hashable {
    case search = 0
    case favorites
    
    var title: String {
        switch self {
        case .search:
            return TabBarLocalization().seachTabTitle
        case .favorites:
            return TabBarLocalization().favoritesTabTitle
        }
    }
    
    var iconName: String {
        switch self {
        case .search:
            return "magnifyingglass"
        case .favorites:
            return "heart"
        }
    }
}
