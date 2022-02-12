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
    
    enum RealtimeAlertType {
        case MAINTENANCE
        case UPDATE
    }
    
    // Realtime Database
    enum StateCheckRealtimeDatabase {
        case NON
        case CHECKED_FALSE
        case CHECKED_TRUE
    }
    
    static let REALTIME_DATABASE_BASE_URL   = "https://breakingnews-2dda2-default-rtdb.europe-west1.firebasedatabase.app/"
    static let REALTIME_DATABASE_CONFIG     = "config"
    
    static let REALTIME_DATABASE_PATH_LIVE      = "live"
    static let REALTIME_DATABASE_PATH_TEST      = "test"
    static let REALTIME_DATABASE_PATH_DEV       = "dev"
    
    static let REALTIME_DATABASE_MAINTENANCE    = "maintenance"
    static let REALTIME_DATABASE_UPDATE         = "version"
    
    static var maintenanceState: StateCheckRealtimeDatabase = StateCheckRealtimeDatabase.NON
    static var updateState: StateCheckRealtimeDatabase      = StateCheckRealtimeDatabase.NON
    
    static var MAINTENANCE_DIALOG_SHOWN = false
    static var UPDATE_DIALOG_SHOWN      = false
        
    static private var FIRST_CHECK      = true
    
    // MARK: - RealtimeDatabase Path
    static var CURRENT_REALTIME_DATABASE_PATH: String {
        switch Configuration.Environment.current {
        case .RELEASE:
            return self.REALTIME_DATABASE_CONFIG + "/" + self.REALTIME_DATABASE_PATH_LIVE
        case .DEBUG:
            return self.REALTIME_DATABASE_CONFIG + "/" + self.REALTIME_DATABASE_PATH_LIVE
        case .TEST:
            return self.REALTIME_DATABASE_CONFIG + "/" + self.REALTIME_DATABASE_PATH_TEST
        case .DEV:
            return self.REALTIME_DATABASE_CONFIG + "/" + self.REALTIME_DATABASE_PATH_DEV
        }
    }
    
    static func resetVariablesValues() {
        self.MAINTENANCE_DIALOG_SHOWN = false
        self.UPDATE_DIALOG_SHOWN = false
    }
    
    static func shouldShownDialog() {
        self.returnFromAppStore()
    }
    
    static func setDatabaseListeners(completion: @escaping (_ state: Bool?) -> Void) {
        self.setMaintenanceListener(completion: {result in
            if result != nil {
                self.FIRST_CHECK = false
                completion(result)
            }
        })
        self.setUpdateListener(completion: {result in
            if result != nil {
                self.FIRST_CHECK = false
                completion(result)
            }
        })
    }
            
    static private func checkStateDatabase(completion: @escaping (_ state: Bool?) -> Void) {
        if (FirebaseDatabaseProvider.maintenanceState == self.StateCheckRealtimeDatabase.NON || FirebaseDatabaseProvider.updateState == self.StateCheckRealtimeDatabase.NON) {
            completion(nil)
        }
        else if (FirebaseDatabaseProvider.maintenanceState == self.StateCheckRealtimeDatabase.CHECKED_TRUE || FirebaseDatabaseProvider.updateState == self.StateCheckRealtimeDatabase.CHECKED_TRUE) {
            completion(false)
        }
        else {
            completion(true)
        }
    }
    
    // Maintenance
    static private func setMaintenanceListener(completion: @escaping (_ state: Bool?) -> Void) {
        let myRef = Database.database(url: self.REALTIME_DATABASE_BASE_URL).reference()
        let maintenance = myRef.child(self.CURRENT_REALTIME_DATABASE_PATH).child(self.REALTIME_DATABASE_MAINTENANCE)
        
        maintenance.observe(DataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? Bool ?? true
            
            FirebaseDatabaseProvider.maintenanceState = .NON
            
            if value {
                self.maintenanceState = self.StateCheckRealtimeDatabase.CHECKED_TRUE
                self.showMaintenanceDialog()
                completion(false)
            }
            else {
                self.maintenanceState = self.StateCheckRealtimeDatabase.CHECKED_FALSE
                
                if self.FIRST_CHECK {
                    self.checkStateDatabase(completion: {result in
                        completion(result)
                    })
                }
            }
        })
    }
    
    static private func showMaintenanceDialog() {
        if !self.MAINTENANCE_DIALOG_SHOWN && self.updateState != self.StateCheckRealtimeDatabase.CHECKED_TRUE {
            self.FIRST_CHECK = false
            
            guard let viewController = UIApplication.getCurrentViewController() else { return }
            
            let alert = self.createAlertType(type: .MAINTENANCE)
                
            self.MAINTENANCE_DIALOG_SHOWN = true
            
            viewController.loadViewController(alert, animated: true, nil, nil, completion: nil)
        }
    }
    
    // Updates
    static private func setUpdateListener(completion: @escaping (_ state: Bool?) -> Void) {
        let myRef = Database.database(url: self.REALTIME_DATABASE_BASE_URL).reference()
        let update = myRef.child(self.CURRENT_REALTIME_DATABASE_PATH).child(self.REALTIME_DATABASE_UPDATE)
        
        update.observe(DataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? Int ?? 0
            
            FirebaseDatabaseProvider.updateState = .NON
            
            if let code = R.bundleVersion {
                let versionCode = Int(code)
                if versionCode! < value {
                    self.updateState = self.StateCheckRealtimeDatabase.CHECKED_TRUE
                    self.showUpdateDialog()
                    completion(false)
                }
                else {
                    self.updateState = self.StateCheckRealtimeDatabase.CHECKED_FALSE
                    
                    if self.FIRST_CHECK {
                        self.checkStateDatabase(completion: {result in
                            completion(result)
                        })
                    }
                }
            }
            else {
                self.updateState = self.StateCheckRealtimeDatabase.CHECKED_TRUE
                self.showUpdateDialog()
                completion(false)
            }
        })
    }
    
    static private func showUpdateDialog() {
        if !self.UPDATE_DIALOG_SHOWN && self.maintenanceState != self.StateCheckRealtimeDatabase.CHECKED_TRUE {
            self.FIRST_CHECK = false
            
            guard let viewController = UIApplication.getCurrentViewController() else { return }
            
            let alert = self.createAlertType(type: .UPDATE)
                
            self.UPDATE_DIALOG_SHOWN = true
            
            viewController.loadViewController(alert, animated: true, nil, nil, completion: nil)
        }
    }
    
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
    
    static private func openAppStore() {
        R.URLs.openAppStoreURL(completion: { url in
            guard let url = url else { return }
            
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(self.returnFromAppStore), name: UIApplication.willEnterForegroundNotification, object: nil)

            UIApplication.shared.open(url)
        })
    }
    
    @objc static func returnFromAppStore() {
        if self.updateState == StateCheckRealtimeDatabase.CHECKED_TRUE {
            self.showUpdateDialog()
        }
        else if self.maintenanceState == StateCheckRealtimeDatabase.CHECKED_TRUE {
            self.showMaintenanceDialog()
        }
    }
}

