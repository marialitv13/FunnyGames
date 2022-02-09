//
//  GamePresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 09.02.2022.
//

import Foundation

protocol GamePresenterProtocol {
    func viewLoaded()
}

class GamePresenter: GamePresenterProtocol {

    weak var view: GameViewProtocol?
    var router: GameRouterProtocol?
    
    func viewLoaded() {
        view?.setupInitialState()
    }
    
}
