//
//  Endpoint.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import Foundation
protocol Endpoint {
    associatedtype ModelType: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var verb: RequestVerb { get }
    
}

enum RequestVerb: String {
    case GET
}

extension Endpoint {
    var request: URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = verb.rawValue
        request.url = baseURL.appendingPathComponent(path)
        
        switch verb {
        case .GET:
            if var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) {
                urlComponents.queryItems = [URLQueryItem(name: "api-key", value: secretKey)]
                request.url = urlComponents.url
                
            }
        }
        return request
    }
}
