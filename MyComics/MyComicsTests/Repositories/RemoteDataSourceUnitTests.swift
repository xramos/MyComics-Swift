//
//  RemoteDataSourceUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
@testable import MyComics

final class RemoteDataSourceUnitTests: XCTestCase {

    var sut: RemoteDataSource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = RemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetSearchCharacterEndpoint() {
        
        // Given
        let request = "search/"
        
        // When
        let response = sut!.getSearchCharacterEndpoint(value: request)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(request)")
    }
    
    func testCharacterEndpoint() {
        
        // Given
        let request = 1
        
        // When
        let response = sut!.getCharacterEndpoint(id: request)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/character/4005-\(request)")
    }
}
