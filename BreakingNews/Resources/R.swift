//
//  R.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation
import UIKit

//Parent resources class
class R {
    
    static var window: UIWindow? {
        return UIApplication.keyWindow
    }
    
    static var bundleVersion: String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return nil }
        return version
    }
    
    static var bundleConfiguration: String? {
        guard let configuration = Bundle.main.infoDictionary?["Configuration"] as? String else { return nil }
        return configuration
    }
    
}
