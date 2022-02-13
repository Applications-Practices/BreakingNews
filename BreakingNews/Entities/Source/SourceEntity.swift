//
//  New.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class SourceEntity: Codable {
    
    var id: String
    var name: String
    var description: String
    var url: String
    var category: String
    var language: String
    var country: String
    
    static let ID           = "id"
    static let NAME         = "name"
    static let DESCRIPTION  = "description"
    static let URL          = "url"
    static let CATEGORY     = "category"
    static let LANGUAGE     = "language"
    static let COUNTRY      = "country"
    
    init(id: String?, name: String?, description: String?, url: String?, category: String?, language: String?, country: String?) {
        self.id = id                    ?? ""
        self.name = name                ?? ""
        self.description = description  ?? ""
        self.url = url                  ?? ""
        self.category = category        ?? ""
        self.language = language        ?? ""
        self.country = country          ?? ""
    }
}
