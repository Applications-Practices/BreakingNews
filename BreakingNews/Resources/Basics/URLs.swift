//
//  URLs.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct URLs {
        
        //MARK: API
        private static let apiCustomSearch  = Constants.API_BASE_URL + Constants.API_URL_CUSTOM_SEARCH_SUFIX + "?q="
        private static let apiTopHeadlines  = Constants.API_BASE_URL + Constants.API_URL_TOP_HEADLINES_SUFIX + "?country="
        private static let apiSources       = Constants.API_BASE_URL + Constants.API_URL_TOP_HEADLINES_SUFIX + Constants.API_URL_HEADLINES_ALL_SOURCES_SUFIX
        private static let apiKey           = Constants.API_URL_API_KEY_SUFIX + "=" + Constants.API_KEY
        
        //MARK: Functions
        //Generics
        static func createURL(string: String) -> URL? {
            let string = string.replacingOccurrences(of: " ", with: "_")
            return URL(string: string)
        }
        
        static func canOpenURL(url: URL) -> URL? {
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
            else {
                return nil
            }
        }
        
        static func openURL(url: URL) {
            UIApplication.shared.open(url)
        }
        
        //Update Dialog
        static func openAppStoreURL(completion: ((URL?) -> Void)) {
            if let url = self.createURL(string:Constants.APP_STORE_BASE_URL + Constants.CURRENT_APP_STORE_ID) {
                completion(self.canOpenURL(url: url))
            }
        }
        
        //API Endpoints
        static func getUrlCustomSearch(search: String) -> URL? {
            return self.createURL(string: self.apiCustomSearch + search + "&" + self.apiKey)
        }
        
        static func getUrlCountryHeadlines(countryISO: String) -> URL? {
            return self.createURL(string: self.apiTopHeadlines + countryISO + "&" + self.apiKey)
        }
        
        static func getUrlSources() -> URL? {
            return self.createURL(string: self.apiSources + "?" + self.apiKey)
        }
        
    }
    
}
