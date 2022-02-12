//
//  SplashViewModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation
import UIKit

class SplashViewModel {
    
    private var model = SplashModel()
    
    func getImage() -> UIImage {
        return self.model.image
    }
    
    func getBackgroundColor () -> UIColor {
        return self.model.backgroundColor
    }
    
    func getDestinationStoryboardIdentifier() -> String {
        return model.destinationStoryboardIdentifier
    }
    
    func getDestinationViewControllerIdentifier() -> String {
        return model.destinationViewControllerIdentifier
    }
}
