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
        view.presenter = presenter
        router.view = view
        router.configurator = self
        
        return view
    }
    
    func configureLogInScreen(createNewGameMode: Bool) -> LogInViewController {
        let view = LogInViewController.controllerFromStoryboard(.registration)
        let presenter = LogInPresenter()
        let router = LogInRouter()

        presenter.view = view
        presenter.router = router
        presenter.createNewGameMode = createNewGameMode
        view.presenter = presenter
        router.view = view
        router.configurator = self
        
        return view
    }
    
    func configurePregameScreen() -> PregameViewController {
        let view = PregameViewController.controllerFromStoryboard(.registration)
        let presenter = PregamePresenter()
        let router = PregameRouter()

        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        router.view = view
        router.configurator = self
        
        return view
    }
    
}

