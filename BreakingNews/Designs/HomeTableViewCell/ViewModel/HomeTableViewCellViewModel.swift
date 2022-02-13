//
//  HomeTableViewCellViewModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation
import UIKit

class HomeTableViewCellViewModel {
    
    private var model = HomeTableViewCellModel()
    
    func getBackgroundColor() -> UIColor {
        return self.model.backgroundColor
    }
    
    func getMainBackgroundColor() -> UIColor {
        return self.model.mainBackgroundColor
    }
    
    func getBorderColor() -> UIColor {
        return self.model.borderColor
    }
    
    func getBorderWidth() -> CGFloat {
        return self.model.borderWidth
    }
    
    func getOverlayBackground() -> UIColor {
        return self.model.overlayBackground
    }
    
    func getTitleTextColor() -> UIColor {
        return self.model.titleTextColor
    }
    
    func getTitleTextSize() -> CGFloat {
        return self.model.titleTextSize
    }
    
    func getDescriptionBackground() -> UIColor {
        return self.model.descriptionBackground
    }
    
    func getDescriptionTextColor() -> UIColor {
        return self.model.descriptionTextColor
    }
    
    func getDescriptionTextSize() -> CGFloat {
        return self.model.descriptionTextSize
    }
    
    func getMaxLinesDescription() -> Int {
        return self.model.maxLinesDescription
    }
    
}
