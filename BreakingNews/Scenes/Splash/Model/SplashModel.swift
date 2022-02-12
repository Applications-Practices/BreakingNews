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
    
    var destinationStoryboardIdentifier: String {
        return R.Storyboards.home
    }
    
    var destinationViewControllerIdentifier: String {
        return R.ViewControllers.homeNavigationController
    }
}
