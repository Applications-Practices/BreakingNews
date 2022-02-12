//
//  TabBarViewModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class TabBarViewModel {
    
    private var model = TabBarModel()
    
    func getBackgroundColor() -> UIColor {
        return self.model.backgroundColor
    }
    
    func getFirstItemViewController() -> UIViewController {
        return self.model.firstItemViewController
    }
    
    func getFirstItemTitle() -> String {
        return self.model.firstItemTitle
    }
    
    func getFirstItemImage() -> UIImage {
        return self.model.firstItemImage
    }
    
    func getFirstItemSelectedImage() -> UIImage {
        return self.model.firstItemSelectedImage
    }
}
