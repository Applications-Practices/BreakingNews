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
}
