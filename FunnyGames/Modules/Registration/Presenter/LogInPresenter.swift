//
//  GameCreationPresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation

protocol LogInPresenterProtocol {
    func viewLoaded()
    func buttonTapped(gameID: String?, nickname: String)
}

class LogInPresenter: LogInPresenterProtocol {

    weak var view: LogInViewProtocol?
    var router: LogInRouterProtocol?
    var createNewGameMode: Bool?
    let defaultAlert = NSLocalizedString("DefaultAlertTitle", comment: "")
    let apiManager = APIManager.shared
    
    func viewLoaded() {
        view?.setupInitialState(createNewGameMode: createNewGameMode ?? false)
    }
    
    func buttonTapped(gameID: String?, nickname: String) {
        switch createNewGameMode {
        case true:
            createNewGame(gameID: gameID, nickname: nickname)
        default:
            addNewMemberToExistingGame(gameID: gameID, nickname: nickname)
        }
    }
    
    private func createNewGame(gameID: String?, nickname: String) {
        let gameID = createGameIDIfNeeded(from: gameID)
        apiManager.addNewGame(gameID: gameID, nickName: nickname) { result in
            switch result {
            case .success:
                UserDefaultsManager.setData(value: nickname, key: .nickname)
                UserDefaultsManager.setData(value: gameID, key: .gameID)
                self.router?.showPregameScreen()
            case .failure:
                self.view?.showErrorAlert(alertTitle: self.defaultAlert)
            }
        }
    }
    
    private func addNewMemberToExistingGame(gameID: String?, nickname: String) {
        apiManager.addNewMemberToExistingGame(gameID: gameID, nickname: nickname) { result in
            switch result {
            case .success:
                self.router?.showPregameScreen()
            case .failure(let errorMessage):
                if errorMessage == .unknown {
                    self.view?.showErrorAlert(alertTitle: self.defaultAlert)
                } else if errorMessage == .wrongId {
                    self.view?.showErrorAlert(alertTitle: NSLocalizedString("WrongIDAlertTitle", comment: ""))
                }
            }
        }
    }
    
    private func createGameIDIfNeeded(from gameID: String?) -> String {
        if gameID == nil {
            return String.random()
        } else {
            return gameID!
        }
    }
    
}


