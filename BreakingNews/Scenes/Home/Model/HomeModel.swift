//
//  HomeModel.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class HomeModel {
    
    var backgroundColor: UIColor {
        return R.Colors.homeBackground
    }
    
    var searchBarBackground: UIColor {
        return R.Colors.homeSearchBarBackground
    }
    
    var searchBarBorderWidth: CGFloat {
        return 0
    }
    
    var searchBarBorderColor: UIColor {
        return R.Colors.homeSearchBarBorder
    }
    
    var searchBarImage: UIImage {
        return UIImage()
    }
    
    var searchBarEnableAlpha: CGFloat {
        return 1.0
    }
    
    var searchBarDisableAlpha: CGFloat {
        return 0.6
    }
    
    var tableViewBackgroundColor: UIColor {
        return R.Colors.homeTableViewBackground
    }
    
    var tableViewCell: String {
        return R.TableViews.homeTableViewCell
    }
    
    var tableViewCellIdentfier: String {
        return R.TableViews.homeTableViewCellIdentifier
    }
    
    var tableViewCellHeight: CGFloat {
        return 300.0
    }
    
    var defaultUrl: URL? {
        return R.URLs.getUrlSources()
    }
}
