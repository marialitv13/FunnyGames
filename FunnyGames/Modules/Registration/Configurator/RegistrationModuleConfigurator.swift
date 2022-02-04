//
//  RegistrationModuleConfigurator.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

class RegistrationModuleConfigurator {
    
    func configureRegistrationSceen() -> RegistrationViewController {
        let view = RegistrationViewController.controllerFromStoryboard(.registration)
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter()
        
        presenter.view = view
        presenter.router = router
        router.view = view
        view.presenter = presenter
        router.configurator = self
        
        return view
    }
    
    func configureGameCreationScreen() -> GameCreationViewController {
        let view = GameCreationViewController.controllerFromStoryboard(.registration)
//        let presenter = RegistrationPresenter()
//        let router = RegistrationRouter()
//
//        presenter.view = view
//        presenter.router = router
//        router.view = view
//        view.presenter = presenter
        
        return view
    }
    
}

