//
//  FirebaseRealtimeProvider.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 12/2/22.
//

import Foundation
import FirebaseDatabase
import UIKit

class FirebaseDatabaseProvider {
    
    //MARK: Variables
    //Database check type
    enum RealtimeAlertType {
        case MAINTENANCE
        case UPDATE
    }
    
    //Realtime Database Check State
    enum StateCheckRealtimeDatabase {
        //Not checked
        case NON
        //Checked and has good result to continue
        case CHECKED_PASS
        //Checked and dont have good result to continue
        case CHECKED_NON_PASS
    }
    
    //Main url from server
    static let REALTIME_DATABASE_BASE_URL   = "https://breakingnews-2dda2-default-rtdb.europe-west1.firebasedatabase.app/"
    //First level of json
    static let REALTIME_DATABASE_CONFIG     = "config"
    
    //Next Json path according to environment
    static let REALTIME_DATABASE_PATH = R.bundleFirebaseDatabasePath
    
    //Type of database request
    static let REALTIME_DATABASE_MAINTENANCE    = "maintenance"
    static let REALTIME_DATABASE_UPDATE         = "version"
    
    //Varible to save state from database checks
    static var maintenanceState: StateCheckRealtimeDatabase = StateCheckRealtimeDatabase.NON
    static var updateState: StateCheckRealtimeDatabase      = StateCheckRealtimeDatabase.NON
    
    //Save if some of alerts is current showing
    static var MAINTENANCE_ALERT_SHOWN = false
    static var UPDATE_ALERT_SHOWN      = false
        
    //First check when app enter to foreground
    static private var FIRST_CHECK      = true
    
    //Current Database Path
    static var CURRENT_REALTIME_DATABASE_PATH: String {
        return self.REALTIME_DATABASE_CONFIG + "/" + (self.REALTIME_DATABASE_PATH ?? "")
    }
    
    static func resetVariablesValues() {
        self.MAINTENANCE_ALERT_SHOWN = false
        self.UPDATE_ALERT_SHOWN = false
    }
    
    //Check if app is comming to foreground and if it should show some alert
    static func shouldShownAlert() {
        self.checkShowSomeAlert()
    }
    
    //Set database listener and return result from checks
    static func setDatabaseListeners(completion: @escaping (_ state: Bool?) -> Void) {
        self.setMaintenanceListener(completion: {result in
            guard let result = result else { return }
            
            self.FIRST_CHECK = false
            completion(result)
        })
        self.setUpdateListener(completion: {result in
            guard let result = result else { return }
            
            self.FIRST_CHECK = false
            completion(result)
        })
    }
            
    //Do logic from checks.
    //Only return value if both components have been checked
    static private func checkStateDatabase(completion: @escaping (_ state: Bool?) -> Void) {
        if (FirebaseDatabaseProvider.maintenanceState == self.StateCheckRealtimeDatabase.NON || FirebaseDatabaseProvider.updateState == self.StateCheckRealtimeDatabase.NON) {
            completion(nil)
        }
        else if (FirebaseDatabaseProvider.maintenanceState == self.StateCheckRealtimeDatabase.CHECKED_NON_PASS || FirebaseDatabaseProvider.updateState == self.StateCheckRealtimeDatabase.CHECKED_NON_PASS) {
            completion(false)
        }
        else {
            completion(true)
        }
    }
    
    //Set Maintenance listener.
    //Call create alert if listener return true.
    static private func setMaintenanceListener(completion: @escaping (_ state: Bool?) -> Void) {
        let myRef = Database.database(url: self.REALTIME_DATABASE_BASE_URL).reference()
        let maintenance = myRef.child(self.CURRENT_REALTIME_DATABASE_PATH).child(self.REALTIME_DATABASE_MAINTENANCE)
        
        maintenance.observe(DataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? Bool ?? true
            
            FirebaseDatabaseProvider.maintenanceState = .NON
            
            if value {
                self.maintenanceState = self.StateCheckRealtimeDatabase.CHECKED_NON_PASS
                self.showMaintenanceAlert()
                completion(false)
            }
            else {
                self.maintenanceState = self.StateCheckRealtimeDatabase.CHECKED_PASS
                
                if self.FIRST_CHECK {
                    self.checkStateDatabase(completion: {result in
                        completion(result)
                    })
                }
            }
        })
    }
    
    //Show maintenance alert
    static private func showMaintenanceAlert() {
        if !self.MAINTENANCE_ALERT_SHOWN && !self.UPDATE_ALERT_SHOWN {
            self.FIRST_CHECK = false
            
            guard let viewController = UIApplication.getCurrentViewController() else { return }
            
            let alert = self.createAlertType(type: .MAINTENANCE)
                
            self.MAINTENANCE_ALERT_SHOWN = true
            
            viewController.loadViewController(alert, animated: true, nil, nil, completion: nil)
        }
    }
    
    //Set Update listener.
    //Call create alert if listener return true.
    static private func setUpdateListener(completion: @escaping (_ state: Bool?) -> Void) {
        let myRef = Database.database(url: self.REALTIME_DATABASE_BASE_URL).reference()
        let update = myRef.child(self.CURRENT_REALTIME_DATABASE_PATH).child(self.REALTIME_DATABASE_UPDATE)
        
        update.observe(DataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? Int ?? 0
            
            FirebaseDatabaseProvider.updateState = .NON
            
            if let code = R.bundleVersion {
                let versionCode = Int(code)
                if versionCode! < value {
                    self.updateState = self.StateCheckRealtimeDatabase.CHECKED_NON_PASS
                    self.showUpdateAlert()
                    completion(false)
                }
                else {
                    self.updateState = self.StateCheckRealtimeDatabase.CHECKED_PASS
                    
                    if self.FIRST_CHECK {
                        self.checkStateDatabase(completion: {result in
                            completion(result)
                        })
                    }
                }
            }
            else {
                self.updateState = self.StateCheckRealtimeDatabase.CHECKED_NON_PASS
                self.showUpdateAlert()
                completion(false)
            }
        })
    }
    
    //Show update alert
    static private func showUpdateAlert() {
        if !self.UPDATE_ALERT_SHOWN && !self.MAINTENANCE_ALERT_SHOWN {
            self.FIRST_CHECK = false
            
            guard let viewController = UIApplication.getCurrentViewController() else { return }
            
            let alert = self.createAlertType(type: .UPDATE)
                
            self.UPDATE_ALERT_SHOWN = true
            
            viewController.loadViewController(alert, animated: true, nil, nil, completion: nil)
        }
    }
    
    //Create alert according to type required
    static private func createAlertType(type: RealtimeAlertType) -> UIAlertController {
        switch type {
        case .MAINTENANCE:
            let closeAction = R.Alerts.createAction(title: R.Strings.titleMaintenanceButtonCloseApp, style: .destructive, handler: { (action: UIAlertAction!) in
                exit(-1)
            })
            
            return R.Alerts.maintenanceAlert(actions: [closeAction])
            
        case .UPDATE:
            let updateAction = R.Alerts.createAction(title: R.Strings.titleUpdateButtonUpdateApp, style: .cancel, handler: { (action: UIAlertAction!) in
                self.openAppStore()
            })
            
            let closeAction = R.Alerts.createAction(title: R.Strings.titleUpdateButtonCloseApp, style: .destructive, handler: { (action: UIAlertAction!) in
                exit(-1)
            })
            
            return R.Alerts.updateAlert(actions: [closeAction, updateAction])
        }
    }
    
    //Do request to app store and open app on it
    static private func openAppStore() {
        R.URLs.openAppStoreURL(completion: { url in
            guard let url = url else { return }
            
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(self.checkShowSomeAlert), name: UIApplication.willEnterForegroundNotification, object: nil)

            R.URLs.openURL(url: url)
        })
    }
    
    //Check if need show some alert
    @objc static func checkShowSomeAlert() {
        self.resetVariablesValues()
        
        if self.updateState == StateCheckRealtimeDatabase.CHECKED_NON_PASS {
            self.showUpdateAlert()
        }
        else if self.maintenanceState == StateCheckRealtimeDatabase.CHECKED_NON_PASS {
            self.showMaintenanceAlert()
        }
    }
}

