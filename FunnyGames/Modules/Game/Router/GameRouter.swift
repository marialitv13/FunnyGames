//
//  GameRouter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 09.02.2022.
//

import Foundation

protocol GameRouterProtocol {
    var view: ModuleTransitionable? { get }
}

class GameRouter: GameRouterProtocol {
    
    weak var view: ModuleTransitionable?
    var configurator: GameModuleConfigurator?
    
}
