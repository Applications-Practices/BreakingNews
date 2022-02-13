//
//  HeadlineResponse.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class HeadlineResponse: Codable {
    
    var status: String?
    var totalResults: Int?
    var articles: [HeadlineEntity]?
    
    static let STATUS           = "status"
    static let TOTAL_RESULTS    = "totalResults"
    static let ARTICLES         = "articles"
    
    init(status: String?, totalResults: Int?, articles: [HeadlineEntity]?) {
        self.status = status                ?? ""
        self.totalResults = totalResults    ?? 0
        self.articles = articles            ?? []
    }
}
