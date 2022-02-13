//
//  SourceResponse.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class SourceResponse: Codable {
    
    var status: String
    var sources: [SourceEntity]
    
    static let STATUS   = "status"
    static let SOURCES  = "sources"
    
    init(status: String?, sources: [SourceEntity]?) {
        self.status = status    ?? ""
        self.sources = sources  ?? []
    }
}
