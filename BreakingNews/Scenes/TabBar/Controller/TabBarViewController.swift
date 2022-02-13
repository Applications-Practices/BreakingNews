//
//  TabBarViewController.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var viewModel = TabBarViewModel()
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultConfiguration()
        self.setDefaultElements()
    }
    
    func setDefaultConfiguration() {
        self.delegate = self
        
        self.setDefaultItems()
    }
    
    func setDefaultElements() {
        self.setBackgroundColor()
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = self.viewModel.getBackgroundColor()
    }
    
    func setDefaultItems() {
        let firstViewController = self.createFirstItem()
        
        let controllers = [firstViewController]
        
        self.viewControllers = controllers
    }
    
    func createFirstItem() -> UIViewController {
        let viewController = self.viewModel.getFirstItemViewController()
        
        let icon = R.TabBars.loadItem(title: self.viewModel.getFirstItemTitle(), image: self.viewModel.getFirstItemImage(), selectedImage: self.viewModel.getFirstItemSelectedImage())
        viewController.tabBarItem = icon
        
        return viewController
    }
}
