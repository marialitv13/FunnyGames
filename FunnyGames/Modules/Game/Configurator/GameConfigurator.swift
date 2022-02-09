//
//  GameConfigurator.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 09.02.2022.
//

import Foundation

class GameModuleConfigurator {
    
    func configureGameSceen() -> GameViewController {
        let view = GameViewController.controllerFromStoryboard(.game)
        let presenter = GamePresenter()
        let router = GameRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        router.configurator = self
        
        return view
    }
    
}
    
