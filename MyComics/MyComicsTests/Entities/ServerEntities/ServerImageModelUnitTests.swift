//
//  ServerImageModelUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
@testable import MyComics

final class ServerImageModelUnitTests: XCTestCase {

    func testImageConvertToEntity() {
        
        // Given
        let serverImageResponse = ServerImageModel(smallUrl: "smallUrl",
                                                   superUrl: "superUrl",
                                                   thumbUrl: "thumbUrl")
        
        // When
        let image = serverImageResponse.convertToEntity()
        
        // Then
        XCTAssertEqual(image.smallUrl, serverImageResponse.smallUrl)
        XCTAssertEqual(image.superUrl, serverImageResponse.superUrl)
        XCTAssertEqual(image.thumbUrl, serverImageResponse.thumbUrl)
    }
}
