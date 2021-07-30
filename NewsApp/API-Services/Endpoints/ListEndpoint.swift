//
//  ListEndPoint.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import Foundation

enum ListEndpoint {
    struct GetNews: Endpoint {
        typealias ModelType = NewsList
        var baseURL: URL = URL(string: NewsAPI.backendURL)!
        var path: String = "mostpopular/v2/mostviewed/all-sections/7.json"
        var verb: RequestVerb = .GET
  }
}
