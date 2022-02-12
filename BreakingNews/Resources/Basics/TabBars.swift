//
//  TabBars.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct TabBars {
        
        static func loadItem(title: String, image: UIImage, selectedImage: UIImage) -> UITabBarItem {
            return UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        }
    
    }
    
}
