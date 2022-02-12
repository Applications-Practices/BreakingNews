//
//  SplashModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation
import UIKit

class SplashModel {
    
    var image: UIImage {
        return R.Images.logo
    }
    
    var backgroundColor: UIColor {
        return R.Colors.splashBackground
    }
    
    var activityIndicatorColor: UIColor {
        return R.Colors.splashActivityIndicatorColor
    }
    
    var destinationStoryboardIdentifier: String {
        return R.Storyboards.tabBar
    }
    
    var destinationViewControllerIdentifier: String {
        return R.ViewControllers.tabBarNavigationController
    }
}
