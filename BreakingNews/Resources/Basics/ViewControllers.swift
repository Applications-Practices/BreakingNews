//
//  ViewControllers.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct ViewControllers {
        
        //MARK: Splash
        static var splashViewController = "SplashViewController"
        
        //MARK: TabBar
        static var tabBarNavigationController   = "TabBarNavigationController"
        static var tabBarViewController         = "TabBarViewController"
        
        //MARK: Home
        static var homeNavigationController = "HomeNavigationController"
        static var homeViewController       = "HomeViewController"
        
        //MARK: Functions
        static func loadViewController<T: UIViewController>(_: T.Type, _ storyboard: String, _ viewControllerIdentifier: String) -> T? {
            let storyboard = UIStoryboard(name: storyboard, bundle: nil)
            if let viewController = storyboard.instantiateViewController (withIdentifier: viewControllerIdentifier) as? T {
                return viewController
            }
            else {
                return nil
            }
        }
        
        static func loadHomeViewController() -> UIViewController {
            return R.ViewControllers.loadViewController(UINavigationController.self, R.Storyboards.home, R.ViewControllers.homeNavigationController)!
        }
    }
    
}
