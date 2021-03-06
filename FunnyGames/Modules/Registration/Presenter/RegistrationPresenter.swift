//
//  RegistrationPresenter.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import Foundation

protocol RegistrationPresenterProtocol {
    func viewLoaded()
    func joinButtonTapped()
    func createNewGameButtonTapped()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view: RegistrationViewProtocol?
    var router: RegistrationRouterProtocol?

    func viewLoaded() {
        view?.setupInitialState()
    }
    
    func joinButtonTapped() {
    }
    
    func createNewGameButtonTapped() {
        print("THEREE")
        router?.showGameCreationScreen()
    }

}

