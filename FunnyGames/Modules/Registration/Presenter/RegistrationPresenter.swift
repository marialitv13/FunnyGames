//
//  RegistrationPresenter.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

protocol RegistrationPresenterProtocol {
    func viewLoaded()
    func joinGameButtonTapped()
    func createNewGameButtonTapped()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?

    func viewLoaded() {
        view?.setupInitialState()
    }
    
    func joinGameButtonTapped() {
        router?.showLogInScreen(createNewGameMode: false)
    }
    
    func createNewGameButtonTapped() {
        router?.showLogInScreen(createNewGameMode: true)
    }

}

