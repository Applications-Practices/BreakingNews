//
//  Color.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation
import UIKit

public extension UIColor {
    
    //App
    class var mainBackground: UIColor {
        return UIColor(named: "mainBackground")!
    }
    class var searchBarBackground: UIColor {
        return UIColor(named: "searchBarBackground")!
    }
    
    //Splash
    class var splashBackground: UIColor {
        return UIColor(named: "splashBackground")!
    }
    
    //TabBar
    class var tabBarBarBackground: UIColor {
        return UIColor(named: "tabBarBarBackground")!
    }
    
    class var tabBarSelectedItem: UIColor {
        return UIColor(named: "tabBarSelectedItem")!
    }
    
    //Home
    class var homeCellOverlayBackground: UIColor {
        return UIColor(named: "homeCellOverlayBackground")!
    }
    class var homeCellBorderColor: UIColor {
        return UIColor(named: "homeCellBorderColor")!
    }
    
}


