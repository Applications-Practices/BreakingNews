//
//  SplashController.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation
import UIKit
import SwiftUI

class SplashViewController: UIViewController {
    
    private var viewModel = SplashViewModel()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultElements()
        self.setFirebaseDatabaseListener()
    }
    
    func setDefaultElements() {
        self.view.backgroundColor = self.viewModel.getBackgroundColor()
        
        self.imageView.image = self.viewModel.getImage()
    }
    
    func setFirebaseDatabaseListener() {
        FirebaseDatabaseProvider.setDatabaseListeners(completion: {result in
            guard let resultBool = result as Bool? else { return }

            if resultBool {
                if let viewController = R.ViewControllers.loadViewController(UINavigationController.self, self.viewModel.getDestinationStoryboardIdentifier(), self.viewModel.getDestinationViewControllerIdentifier()) {
                    self.loadViewController(viewController, animated: true, .fullScreen, .flipHorizontal, completion: nil)
                }
                
            }
        })
    }
}
