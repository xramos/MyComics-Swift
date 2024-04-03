//
//  ServerPowerUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
@testable import MyComics

final class ServerPowerUnitTests: XCTestCase {
    
    func testPowerConvertToEntity() {
        
        // Given
        let serverPowerResponse = ServerPower(id: 1,
                                              name: "name")
        
        // When
        let power = serverPowerResponse.convertToEntity()
        
        // Then
        XCTAssertEqual(power.id, serverPowerResponse.id)
        XCTAssertEqual(power.name, serverPowerResponse.name)
    }
}
