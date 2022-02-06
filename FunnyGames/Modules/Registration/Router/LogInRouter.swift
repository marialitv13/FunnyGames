//
//  GameCreationRouter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation

protocol LogInRouterProtocol {
    var view: ModuleTransitionable? { get set }
    func showPregameScreen()
}

class LogInRouter: LogInRouterProtocol {
 
    weak var view: ModuleTransitionable?
    var configurator: RegistrationModuleConfigurator?
  
    func showPregameScreen() {
        guard let configurator = self.configurator else { return }
        view?.push(module: configurator.configurePregameScreen(), animated: true)
    }
    
}
