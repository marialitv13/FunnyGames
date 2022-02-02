//
//  LaunchInstructor.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

enum LaunchInstructor {
    case registration, main
    
    static func setupInitialPage() -> LaunchInstructor {
        switch SessionManager.isAuthorized {
        case false:
            return .registration
        default:
            return .main
        }
    }
    
    static func performRegistration() -> RegistrationViewController {
        return RegistrationModuleConfigurator().configure()
    }

}
