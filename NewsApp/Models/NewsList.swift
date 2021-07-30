//
//  NewsModel.swift
//  NewsApp
//
//  Created by Karthika on 7/29/21.
//

import Foundation
struct NewsList: Codable {
    let status : String!
    let numResults: Int!
    let results: [Results]!

    enum CodingKeys: String, CodingKey {
        case status
        case numResults = "num_results"
        case results
    }
}
struct Results: Codable {
    let url: String
    let publishedDate, updated, section, subsection: String
    let byline: String
    let title, abstract: String


    enum CodingKeys: String, CodingKey {
        case url
        case publishedDate = "published_date"
        case updated, section, subsection
        case byline, title, abstract
    }
}
