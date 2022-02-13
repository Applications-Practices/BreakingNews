//
//  HeadlineEntity.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation

class HeadlineEntity: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    static let AUTHOR       = "author"
    static let TITLE        = "title"
    static let DESCRIPTION  = "description"
    static let URL          = "url"
    static let URL_TO_IMAGE = "urlToImage"
    static let PUBLISHED_AT = "publishedAt"
    static let CONTENT      = "content"
    
    init(author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.author = author            ?? ""
        self.title = title              ?? ""
        self.description = description  ?? ""
        self.url = url                  ?? ""
        self.urlToImage = urlToImage    ?? ""
        self.publishedAt = publishedAt  ?? ""
        self.content = content          ?? ""
    }
}
