//
//  Environment.swift
//  BreakingNews
//
//  Created by Pablo López Iborra on 11/2/22.
//

import Foundation

extension Configuration {
    
    enum Environment: String {
        
        // MARK: - Enviroments
        case RELEASE
        case DEBUG
        case TEST
        case DEV
        
        // MARK: - Current Enviroment
        static let current: Environment = {
            guard let rawValue = R.bundleConfiguration else {
                fatalError("No Enviroment Found")
            }

            guard let environment = Environment(rawValue: rawValue.uppercased()) else {
                fatalError("Invalid Enviroment")
            }

            return environment
        }()

        // MARK: - Firebase File
        static var FiresbaseFile: String {
            return R.bundleFirebaseFileName ?? ""
        }
        
    }
    
}
