//
//  Alerts.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct Alerts {
        
        static func loadAlert(title: String, message: String, preferredStryle: UIAlertController.Style, actions: [UIAlertAction]) -> UIAlertController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStryle)
            
            for action in actions {
                alert.addAction(action)
            }
            
            return alert
        }
        
        static func createAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
            return UIAlertAction(title: title, style: style, handler: handler)
        }
        
        static func maintenanceAlert(actions: [UIAlertAction]) -> UIAlertController{
            return R.Alerts.loadAlert(title: R.Strings.titleMaintenanceDialog, message: R.Strings.textMaintenanceDialog, preferredStryle: .alert, actions: actions)
        }
        
        static func updateAlert(actions: [UIAlertAction]) -> UIAlertController{
            return R.Alerts.loadAlert(title: R.Strings.titleUpdateDialog, message: R.Strings.textUpdateDialog, preferredStryle: .alert, actions: actions)
        }
        
    }
    
}
