//
//  GameCreationRouter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation

protocol GameCreationRouterProtocol {
    var view: ModuleTransitionable? { get set }
//    func showGameCreationScreen()
}

class GameCreationRouter: GameCreationRouterProtocol {
 
    weak var view: ModuleTransitionable?
    var configurator: RegistrationModuleConfigurator?
//    
//    func showGameCreationScreen() {
//        guard let configurator = self.configurator else { return }
//        view?.push(module: configurator.configureGameCreationScreen(), animated: true)
//    }
    
}
