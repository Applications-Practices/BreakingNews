//
//  TableViews.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 13/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct TableViews {
        
        //MARK:  Variables
        //Home
        static var homeTableViewCell            = "HomeTableViewCell"
        static var homeTableViewCellIdentifier  = "homeTableViewCell"
        
        //MARK: Functions
        static func registerTable(tableView: UITableView, nibName: String, cellIdentifier: String) {
            tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        }
        
        static func getTableViewCell<T: UITableViewCell>(_: T.Type, tableView:UITableView, cellIdentifier: String) -> T? {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? T {
                return cell
            }
            else {
                return nil
            }
        }
    }
    
}
