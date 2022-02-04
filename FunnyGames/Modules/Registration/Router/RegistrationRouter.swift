//
//  RegistrationRouter.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

protocol RegistrationRouterProtocol {
    var view: ModuleTransitionable? { get set }
    func showGameCreationScreen()
}

class RegistrationRouter: RegistrationRouterProtocol {
 
    weak var view: ModuleTransitionable?
    var configurator: RegistrationModuleConfigurator?
    
    func showGameCreationScreen() {
        guard let configurator = self.configurator else { return }
        view?.push(module: configurator.configureGameCreationScreen(), animated: true)
    }
    
}
