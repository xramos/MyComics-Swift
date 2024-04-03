//
//  RemoteDataSource.swift
//  MyComics
//
//  Created by Xavier Ramos on 3/4/24.
//

import Foundation
import Combine

class RemoteDataSource {
    
    // URLs
    
    static let searchURL: String = "search/"
    static let getCharacterURL: String = "character/"
    
    // Variables
    
    private let baseURLString: String
    private let session: URLSession
    
    // MARK: - Methods
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func searchCharacter(value: String) -> AnyPublisher<ServerBaseArrayResponse<ServerCharacter>, Error> {
        
        let networkManager = ComicsNetworkManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getSearchCharacterEndpoint(value: value)
        
        return networkManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCharacter(id: Int) -> AnyPublisher<ServerBaseResponse<ServerCharacter>, Error> {
        
        let networkManager = ComicsNetworkManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getCharacterEndpoint(id: id)
        
        return networkManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemoteDataSource {
    
    func getSearchCharacterEndpoint(value: String) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemoteDataSource.searchURL)"
        
        var components = URLComponents(string: endpoint)
        
        let queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey),
                          URLQueryItem(name: "query", value: value),
                          URLQueryItem(name: "format", value: "json"),
                          URLQueryItem(name: "field_list", value: "id,image,name,aliases,real_name,gender"),
                          URLQueryItem(name: "resources", value: "character"),
                          URLQueryItem(name: "limit", value: "100" )]
        
        components?.queryItems = queryItems
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getCharacterEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemoteDataSource.getCharacterURL)4005-\(id)"
        
        var components = URLComponents(string: endpoint)
        
        let queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey),
                          URLQueryItem(name: "format", value: "json"),
                          URLQueryItem(name: "field_list", value: "id,image,name,aliases,real_name,birth,deck,gender,origin,powers")]
        
        components?.queryItems = queryItems
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
