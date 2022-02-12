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
        
        private static let FILE_PRODUCTION_GOOGLE_SERVICES_GLOBAL   = "GoogleService-Info"
        private static let FILE_TEST_GOOGLE_SERVICES_GLOBAL         = "GoogleService-Info-Test"
        private static let FILE_DEVELOPMENT_GOOGLE_SERVICES_GLOBAL  = "GoogleService-Info-Dev"
        
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
            switch self.current {
            case .RELEASE:
                return self.FILE_PRODUCTION_GOOGLE_SERVICES_GLOBAL
            case .DEBUG:
                return self.FILE_PRODUCTION_GOOGLE_SERVICES_GLOBAL
            case .TEST:
                return self.FILE_TEST_GOOGLE_SERVICES_GLOBAL
            case .DEV:
                return self.FILE_DEVELOPMENT_GOOGLE_SERVICES_GLOBAL
            }
        }
        
    }
    
}
