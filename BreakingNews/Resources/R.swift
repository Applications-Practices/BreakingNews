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
    //MARK: Generic Resources
    //Main window
    static var window: UIWindow? {
        return UIApplication.keyWindow
    }
    
    //App version
    static var bundleVersion: String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return nil }
        return version
    }
    
    //Configuration file
    static var bundleConfiguration: String? {
        guard let configuration = Bundle.main.infoDictionary?["Configuration"] as? String else { return nil }
        return configuration
    }
    
    //Newsapi Api Key
    static var bundleApiKey: String? {
        guard let apiKey = Bundle.main.infoDictionary?["Api key"] as? String else { return nil }
        return apiKey
    }
    
    //Firebase config file name
    static var bundleFirebaseFileName: String? {
        guard let firebaseFileName = Bundle.main.infoDictionary?["Firebase file name"] as? String else { return nil }
        return firebaseFileName
    }
    
    //Firebase database path
    static var bundleFirebaseDatabasePath: String? {
        guard let firebaseDatabasePath = Bundle.main.infoDictionary?["Firebase database path"] as? String else { return nil }
        return firebaseDatabasePath
    }
    
    //MARK: Functions
    //Set default configuration to app interface
    static func setDefaultConfiguration() {
        UITabBar.appearance().backgroundColor = R.Colors.tabBarBarBackground
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = R.Colors.tabBarSelectedItemColor
        UITabBar.appearance().unselectedItemTintColor = R.Colors.tabBarUnselectedItemColor
        UITabBar.appearance().isOpaque = false
    }
    
}
