//
//  Images.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit
import Kingfisher

extension R {
    
    struct Images {
        
        //MARK: App
        static var logo: UIImage {
            return UIImage(named: "logo")!
        }
        
        //MARK: TabBar
        static var tabBarFirstItem: UIImage {
            return UIImage(systemName: "house")!
        }
        
        //MARK: Functions
        static func loadImage(imageView: UIImageView, url: URL?, placeHolder: UIImage?, completion: ((Result<RetrieveImageResult, KingfisherError>) -> Void)?) {
            imageView.kf.setImage(with: url, placeholder: placeHolder, completionHandler: completion)
        }
    }
    
}
