//
//  ServerCharacterUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
@testable import MyComics

final class ServerCharacterUnitTests: XCTestCase {

    func testConvertToEntity() {
        
        // Given
        let serverCharacter = ServerCharacter(id: 0,
                                              name: "name",
                                              realName: "realName",
                                              aliases: "aliases",
                                              image: nil,
                                              birth: nil,
                                              deck: nil,
                                              gender: nil,
                                              origin: nil,
                                              powers: [])
        
        // When
        let character = serverCharacter.converToEntity()
        
        // Then
        XCTAssertEqual(character.id, serverCharacter.id)
        XCTAssertEqual(character.name, serverCharacter.name)
        XCTAssertEqual(character.realName, serverCharacter.realName)
        XCTAssertEqual(character.aliases, serverCharacter.aliases)
    }
}
