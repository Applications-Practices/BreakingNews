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
        
        static func openURL(string: String) -> URL? {
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
        
        static func openAppStoreURL(completion: ((URL?) -> Void)) {
            if let url = self.openURL(string:Constants.APP_STORE_BASE_URL + Constants.CURRENT_APP_STORE_ID) {
                completion(self.canOpenURL(url: url))
            }
        }
        
    }
    
}
