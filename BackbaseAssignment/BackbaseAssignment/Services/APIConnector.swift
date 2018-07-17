//
//  APIConnector.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-15.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
}

enum APIError {
    case generic
    case server
}

class APIConnector {
    private let apiKey = "c6e381d8c7ff98f0fee43775817cf6ad"
    private let baseUrl = "https://api.openweathermap.org/data/2.5"
    private let appIdQueryParameter = "appid"
    
    func performCall<T : Codable>(toEndpoint endpoint:String,
                                  using method:HTTPMethod,
                                  responseType:T.Type,
                                  completion: @escaping (_ error:APIError?, _ response:T?) -> Void) {
        let request = createURLRequest(toEndpoint: endpoint, using: method.rawValue)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!)
                completion(.generic, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.generic, nil)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.server, nil)
                return
            }
            
            let serverResponse = T.decode(from: data)
            completion(nil, serverResponse)
        }
        
        task.resume()
    }
    
    private func createURLRequest(toEndpoint endpoint:String, using method:String) -> URLRequest {
        let apiUrl = (baseUrl + endpoint).addQueryParameter(appIdQueryParameter, value: apiKey)
        let url = URL(string: apiUrl)!
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
