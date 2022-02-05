//
//  GameCreationPresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation
import Firebase

protocol LogInPresenterProtocol {
    func viewLoaded()
    func buttonTapped(gameID: String?, nickname: String)
}

class LogInPresenter: LogInPresenterProtocol {

    weak var view: LogInViewProtocol?
    var router: LogInRouterProtocol?
    var createNewGameMode: Bool?
    let database = Firestore.firestore()
    
    func viewLoaded() {
        view?.setupInitialState(createNewGameMode: createNewGameMode ?? false)
    }
    
    func buttonTapped(gameID: String?, nickname: String) {
        if createNewGameMode == true {
            database.collection("New game").addDocument(data: ["gameId": gameID ?? String.random(), "nickname": nickname])
        } else {
            
        }
    }

}


