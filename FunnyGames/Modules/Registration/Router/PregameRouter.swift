//
//  PregameRouter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation

protocol PregameRouterProtocol {
    var view: ModuleTransitionable? { get }
    func showGameScreen()
}

class PregameRouter: PregameRouterProtocol {
    
    weak var view: ModuleTransitionable?
    var configurator: RegistrationModuleConfigurator?
    
    func showGameScreen() {
        view?.push(module: GameModuleConfigurator().configureGameSceen(), animated: true)
    }
    
}
