//
//  HomeTableViewCellModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation
import UIKit

class HomeTableViewCellModel {
    
    var backgroundColor: UIColor {
        return R.Colors.homeCellBackground
    }
    
    var mainBackgroundColor: UIColor {
        return R.Colors.homeCellMainBackground
    }
    
    var borderColor: UIColor {
        return R.Colors.homeCellBorderColor
    }
    
    var borderWidth: CGFloat {
        return 2.0
    }
    
    var overlayBackground: UIColor {
        return R.Colors.homeCellOverlayBackground
    }
    
    var titleTextColor: UIColor {
        return R.Colors.homeCellTitleText
    }
    
    var titleTextSize: CGFloat {
        return 17.0
    }
    
    var descriptionBackground: UIColor {
        return R.Colors.homeCellDescriptionBackground
    }
    
    var descriptionTextColor: UIColor {
        return R.Colors.homeCellDescriptionText
    }
    
    var descriptionTextSize: CGFloat {
        return 14.0
    }
    
    var maxLinesDescription: Int {
        return 4
    }
    
}
