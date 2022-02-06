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
            database.collection("New game").addDocument(data: ["gameId": gameID ?? String.random(), "nickname": nickname]) { error in
                if error != nil {
                    self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
                } else {
                    UserDefaultsManager.setData(value: nickname, key: .nickname)
                    UserDefaultsManager.setData(value: gameID ?? String.random(), key: .gameID)
                    self.router!.showPregameScreen()
                }
            }
        } else {
            database.collection("New game").getDocuments { (snapshot, error) in
                if error != nil {
                    self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
                } else {
                    guard let snapshot = snapshot else {
                        self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
                        return
                    }
                    for document in snapshot.documents {
                        let data = document.data()
                        let oneOfGameIDs = data["gameId"] as? String ?? ""
                        if oneOfGameIDs == gameID {
                            self.database.collection("New game").addDocument(data: ["gameId": gameID ?? String.random(), "nickname": nickname]) { error in
                                if error != nil {
                                    self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
                                }
                            }
                        } else {
                            self.view?.showErrorAlert(alertTitle: NSLocalizedString("WrongIDAlertTitle", comment: ""))
                        }
                    }
                }
            }
        }
    }
    
    private func addToDatabase(gameID: String?, nickname: String) {
        database.collection("New game").addDocument(data: ["gameId": gameID ?? String.random(), "nickname": nickname]) { error in
            if error != nil {
                self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
            }
        }
    }
    
}


