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
        
        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        router.view = view
        router.configurator = self
        
        return view
    }
    
}
    
