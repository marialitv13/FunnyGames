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
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        router.configurator = self
        
        return view
    }
    
    func configureLogInScreen(_ createNewGameModeOn: Bool) -> LogInViewController {
        let view = LogInViewController.controllerFromStoryboard(.registration)
        let presenter = LogInPresenter()
        let router = LogInRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.createNewGameModeOn = createNewGameModeOn
        router.view = view
        router.configurator = self
        
        return view
    }
    
    func configurePregameScreen(_ gameCreatorModeOn: Bool) -> PregameViewController {
        let view = PregameViewController.controllerFromStoryboard(.registration)
        let presenter = PregamePresenter()
        let router = PregameRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.gameCreatorModeOn = gameCreatorModeOn
        router.view = view
        router.configurator = self
        
        return view
    }
    
}

