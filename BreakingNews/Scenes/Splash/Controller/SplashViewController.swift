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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var viewModel = SplashViewModel()
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultElements()
        self.setFirebaseDatabaseListener()
    }
    
    func setDefaultElements() {
        self.setBackgroundColor()
        self.setImageView()
        self.setActivityIndicatorView()
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = self.viewModel.getBackgroundColor()
    }
    
    func setImageView() {
        self.imageView.image = self.viewModel.getImage()
    }
    
    func setActivityIndicatorView() {
        self.activityIndicatorView.color = self.viewModel.getActivityIndicatorColor()
        self.activityIndicatorView.startAnimating()
    }
    
    func setFirebaseDatabaseListener() {
        FirebaseDatabaseProvider.setDatabaseListeners(completion: {result in
            self.activityIndicatorView.stopAnimating()
            
            guard let resultBool = result as Bool? else { return }
            
            if resultBool {
                if let viewController = R.ViewControllers.loadViewController(UINavigationController.self, self.viewModel.getDestinationStoryboardIdentifier(), self.viewModel.getDestinationViewControllerIdentifier()) {
                    self.loadViewController(viewController, animated: true, .fullScreen, .flipHorizontal, completion: nil)
                }
            }
        })
    }
}
