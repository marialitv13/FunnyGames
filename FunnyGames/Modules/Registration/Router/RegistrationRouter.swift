//
//  RegistrationRouter.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

protocol RegistrationRouterProtocol {
    var view: ModuleTransitionable? { get set }
    func showLogInScreen(createNewGameMode: Bool)
}

class RegistrationRouter: RegistrationRouterProtocol {
    
    weak var view: ModuleTransitionable?
    var configurator: RegistrationModuleConfigurator?
    
    func showLogInScreen(createNewGameMode: Bool) {
        view?.push(module: configurator!.configureLogInScreen(createNewGameMode: createNewGameMode), animated: true)
    }
    
}
