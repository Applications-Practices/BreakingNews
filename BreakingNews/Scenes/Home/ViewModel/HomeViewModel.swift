//
//  HomeViewModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private var model = HomeModel()
    
    func getBackgroundColor() -> UIColor {
        return self.model.backgroundColor
    }
    
    func getSearchBarBackgroundColor() -> UIColor {
        return self.model.searchBarBackground
    }
    
    func getSearchBarBoderWidth() -> CGFloat {
        return self.model.searchBarBorderWidth
    }
    
    func getSearchBarBorderColor() -> UIColor {
        return self.model.searchBarBorderColor
    }
    
    func getSearchBarTintColor() -> UIColor {
        return self.model.searchBarTintColor
    }
    
    func getSearchBarTextColor() -> UIColor {
        return self.model.searchBarTextColor
    }
    
    func getSearchBarLeftImageColor() -> UIColor {
        return self.model.searchBarLeftImageColor
    }
    
    func getSearchBarImage() -> UIImage {
        return self.model.searchBarImage
    }
    
    func getSearchBarEnableAlpha() -> CGFloat {
        return self.model.searchBarEnableAlpha
    }
    
    func getSearchBarDisableAlpha() -> CGFloat {
        return self.model.searchBarDisableAlpha
    }

    func getTableViewBackgroundColor() -> UIColor {
        return self.model.tableViewBackgroundColor
    }
    
    func getTableViewCell() -> String {
        return self.model.tableViewCell
    }
    
    func getTableViewCellIdentifier() -> String {
        return self.model.tableViewCellIdentfier
    }
    
    func getTableViewCellHeight() -> CGFloat {
        return self.model.tableViewCellHeight
    }
    
    func getDefaultUrl() -> URL? {
        return self.model.defaultUrl
    }
}
