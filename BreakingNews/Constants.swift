//
//  Constants.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation

class Constants {
    
    //MARK: App Store
    static var APP_STORE_BASE_URL   = "itms-apps://apple.com/app/id"
    static var CURRENT_APP_STORE_ID = ""
    
    //MARK: API
    static var API_BASE_URL                         = "https://newsapi.org/v2"
    static var API_URL_CUSTOM_SEARCH_SUFIX          = "/everything"
    static var API_URL_TOP_HEADLINES_SUFIX          = "/top-headlines"
    static var API_URL_HEADLINES_ALL_SOURCES_SUFIX  = "/sources"
    static var API_URL_API_KEY_SUFIX                = "apiKey"
    static var API_KEY                              = R.bundleApiKey ?? ""
}
