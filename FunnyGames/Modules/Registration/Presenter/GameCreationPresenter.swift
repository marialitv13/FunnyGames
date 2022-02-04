//
//  GameCreationPresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation

protocol GameCreationPresenterProtocol {
    func viewLoaded()
    func createNewGameButtonTapped(gameID: String?, nickname: String)
}

class GameCreationPresenter: GameCreationPresenterProtocol {
 
    weak var view: GameCreationViewProtocol?
    var router: GameCreationRouterProtocol?
    
    func viewLoaded() {
        view?.setupInitialState()
    }
    
    func createNewGameButtonTapped(gameID: String?, nickname: String) {
        if gameID != nil {
            
        } else {
        print(String.random())
        }
    }

}


