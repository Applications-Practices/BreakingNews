//
//  TabBarModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class TabBarModel {
    
    var backgroundColor: UIColor {
        return R.Colors.tabBarBackground
    }
    
    var firstItemViewController: UIViewController {
        return HomeViewController()
    }
    
    var firstItemTitle: String {
        return ""
    }
    
    var firstItemImage: UIImage {
        return R.Images.tabBarFirstItem
    }
    
    var firstItemSelectedImage: UIImage {
        return R.Images.tabBarFirstItem
    }
    
}
