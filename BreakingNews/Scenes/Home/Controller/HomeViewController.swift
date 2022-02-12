//
//  HomeViewController.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultElements()
    }
    
    func setDefaultElements() {
        self.setBackgroundColor()
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = self.viewModel.getBackgroundColor()
    }
}
