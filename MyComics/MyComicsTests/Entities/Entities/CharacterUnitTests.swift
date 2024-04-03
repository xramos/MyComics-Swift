//
//  CharacterUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
@testable import MyComics

final class CharacterUnitTests: XCTestCase {
    
    func testGetGenderIsCalled() {
        
        // Given
        let character = Character(id: 1,
                                  name: "name",
                                  realName: "realName",
                                  aliases: "aliases",
                                  image: nil,
                                  birth: "birth",
                                  deck: "deck",
                                  gender: Gender(rawValue: 1) ?? .other,
                                  origin: "origin",
                                  powers: [])
        
        //When
        let gender = character.getGender()
        
        //Then
        XCTAssertNotNil(gender)
        XCTAssertEqual(gender.description, character.gender.description)
    }
    
    func testGetPowerIsCalled() {
        
        // Given
        var powerArray: [Power] = []
        
        let power1 = Power(id: 1, name: "Fly")
        let power2 = Power(id: 2, name: "Telekinesis")
        
        powerArray.append(power1)
        powerArray.append(power2)
        
        let character = Character(id: 1,
                                  name: "name",
                                  realName: "realName",
                                  aliases: "aliases",
                                  image: nil,
                                  birth: "birth",
                                  deck: "deck",
                                  gender: Gender(rawValue: 1) ?? .other,
                                  origin: "origin",
                                  powers: powerArray)
        
        // When
        let power = character.getPowers()
        
        // Then
        XCTAssertNotNil(power)
        XCTAssertEqual(power, "Fly, Telekinesis")
    }
}
