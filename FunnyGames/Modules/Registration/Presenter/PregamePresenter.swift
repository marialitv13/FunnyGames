//
//  PregamePresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation

protocol PregamePresenterProtocol {
    func viewLoaded()
}

class PregamePresenter: PregamePresenterProtocol {
    
    weak var view: PregameViewProtocol?
    var router: PregameRouterProtocol?

    func viewLoaded() {
        view?.setupInitialState(gameID: UserDefaultsManager.getData(type: String.self, forKey: .gameID) ?? "")
    }

}
