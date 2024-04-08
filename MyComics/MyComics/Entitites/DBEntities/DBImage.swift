//
//  DBImage.swift
//  MyComics
//
//  Created by Xavier Ramos on 8/4/24.
//

import Foundation

extension DBImage {
    
    func convertToEntity() -> ImageModel {
        
        return ImageModel(smallUrl: smallUrl ?? "",
                          superUrl: superUrl ?? "",
                          thumbUrl: thumbUrl ?? "")
    }
}
