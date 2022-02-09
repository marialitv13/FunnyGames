//
//  LaunchInstructor.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

enum LaunchInstructor {
    case registration, game
    
    static func setupInitialPage() -> LaunchInstructor {
        switch SessionManager.isAuthorized {
        case true:
            return .game
        default:
            return .registration
        }
    }
    
    static func performRegistration() -> RegistrationViewController {
        return RegistrationModuleConfigurator().configureRegistrationSceen()
    }
    
    static func performGame() -> GameViewController {
        return GameModuleConfigurator().configureGameSceen()
    }
    
}
