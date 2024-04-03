//
//  RepositoryImplementationUnitTests.swift
//  MyComicsTests
//
//  Created by Xavier Ramos on 3/4/24.
//

import XCTest
import Combine
@testable import MyComics

final class RepositoryImplementationUnitTests: XCTestCase {
    
    var sut: RepositoryImplementation?
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
}

// MARK: - Search

extension RepositoryImplementationUnitTests {
    
    func testGetSearchOK() {
        
        // Given
        let search = "batman"
        let session = getSearchSession(statusCode: successStatusCode)
        
        let remote = RemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = RepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.searchCharacter(value: search)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { searchElements in
                
                XCTAssertEqual(searchElements.count, 1)
                XCTAssertEqual(searchElements.first?.id, 1)
                XCTAssertEqual(searchElements.first?.name, "Batman")
                XCTAssertEqual(searchElements.first?.realName, "Bruce Wayne")
                XCTAssertEqual(searchElements.first?.aliases, "Black Knight")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetSearchError() {
        
        // Given
        let search = "batman"
        let session = getSearchSession(statusCode: failureStatusCode)
        
        let remote = RemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = RepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.searchCharacter(value: search)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { searchElements in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Get Character

extension RepositoryImplementationUnitTests {
    
    func testGetCharacterOK() {
        
        // Given
        let id = 1
        let session = getCharacterSession(statusCode: successStatusCode, id: id)
        
        let remote = RemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = RepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getCharacter(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { character in
                
                XCTAssertEqual(character.id, 1)
                XCTAssertEqual(character.name, "Batman")
                XCTAssertEqual(character.realName, "Bruce Wayne")
                XCTAssertEqual(character.aliases, "Black Knight")
                XCTAssertEqual(character.birth, "birth")
                XCTAssertEqual(character.deck, "deck")
                XCTAssertEqual(character.gender, Gender.male)
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetCharacterError() {
        
        // Given
        let id = 1
        let session = getCharacterSession(statusCode: failureStatusCode, id: id)
        
        let remote = RemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = RepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getCharacter(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { searchElements in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Session

extension RepositoryImplementationUnitTests {
    
    func getSearchSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/search/?api_key=\(Constants.apiKey)&query=batman&format=json&field_list=id,image,name,aliases,real_name,gender&resources=character&limit=100")
        
        // data we expect to receive
        let data = getSearchData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getCharacterSession(statusCode: Int, id: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/character/4005-\(id)?api_key=\(Constants.apiKey)&format=json&field_list=id,image,name,aliases,real_name,birth,deck,gender,origin,powers")
        
        // data we expect to receive
        let data = getCharacterData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getSearchData() -> Data {
        
        let dataString = """
                                    {
                                    "results": [{
                                        "id": 1 ,
                                        "name": "Batman",
                                        "real_name": "Bruce Wayne",
                                        "aliases": "Black Knight",
                                        "image": {},
                                        "gender": 1
                                    }]
                                    }
                        """
        
        return Data(dataString.utf8)
    }
    
    func getCharacterData() -> Data {
        
        let dataString = """
                                    {
                                    "results": {
                                        "id": 1 ,
                                        "name": "Batman",
                                        "real_name": "Bruce Wayne",
                                        "aliases": "Black Knight",
                                        "birth": "birth",
                                        "deck": "deck",
                                        "image": {},
                                        "gender": 1,
                                        "origin": {
                                            "id": 4,
                                            "name": "Human"
                                        },
                                        "powers": [{
                                            "id": 3,
                                            "name": "Agility"
                                        }]
                                    }
                                    }
                        """
        
        return Data(dataString.utf8)
    }
}
