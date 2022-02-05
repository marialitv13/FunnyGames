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
            addToDatabase(gameID: gameID, nickname: nickname)
        } else {
            database.collection("New game").getDocuments { (snapshot, error) in
                if error != nil {
                    self.view?.showErrorAlert()
                } else {
                    guard let snapshot = snapshot else {
                        self.view?.showErrorAlert()
                        return
                    }
                    for document in snapshot.documents {
                        let data = document.data()
                        let oneOfGameIDs = data["gameId"] as? String ?? ""
                        if oneOfGameIDs == gameID {
                            self.addToDatabase(gameID: gameID, nickname: nickname)
                        }
                    }
                }
            }
        }
    }
    
    private func addToDatabase(gameID: String?, nickname: String) {
        database.collection("New game").addDocument(data: ["gameId": gameID ?? String.random(), "nickname": nickname])
    }
    
}


