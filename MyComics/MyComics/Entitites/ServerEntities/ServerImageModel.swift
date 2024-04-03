//
//  ServerImageModel.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation

struct ServerImageModel: Codable {
    
    let smallUrl: String?
    let superUrl: String?
    let thumbUrl: String?
    
    func convertToEntity() -> ImageModel {
        
        return ImageModel(smallUrl: smallUrl,
                          superUrl: superUrl,
                          thumbUrl: thumbUrl)
    }
}
