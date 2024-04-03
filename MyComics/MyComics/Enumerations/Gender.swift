//
//  Gender.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

enum Gender: Int, CaseIterable {
    
    case other, male, female
    
    var description: String {
        switch self {
        case .other:
            return "Other"
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}
