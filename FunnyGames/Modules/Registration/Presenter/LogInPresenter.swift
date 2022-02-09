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
    var createNewGameModeOn: Bool?
    private let defaultAlert = NSLocalizedString("DefaultAlertTitle", comment: "")
    
    func viewLoaded() {
        view?.setupInitialState(createNewGameModeOn ?? false)
    }
    
    func buttonTapped(gameID: String?, nickname: String) {
        switch createNewGameModeOn {
        case true:
            createNewGame(gameID: gameID, nickname: nickname)
        default:
            addNewMember(for: gameID, nickname: nickname)
        }
    }
    
    private func createNewGame(gameID: String?, nickname: String) {
        let gameID = generateGameIDIfNeeded(from: gameID)
        APIManager().createNewGame(gameID: gameID, nickName: nickname) { result in
            switch result {
            case .success:
                self.saveDataToUserDefaults(gameID, nickname)
                self.router?.showPregameScreen(gameCreatorModeOn: true)
            default:
                self.view?.showErrorAlert(alertTitle: self.defaultAlert)
            }
        }
    }
    
    private func addNewMember(for gameID: String?, nickname: String) {
        APIManager().addNewMember(for: gameID, nickname: nickname) { result in
            switch result {
            case .success:
                self.saveDataToUserDefaults(gameID!, nickname)
                self.router?.showPregameScreen(gameCreatorModeOn: false)
            case .failure(let errorMessage):
                if errorMessage == .unknown {
                    self.view?.showErrorAlert(alertTitle: self.defaultAlert)
                } else {
                    self.view?.showErrorAlert(alertTitle: NSLocalizedString("WrongIDAlertTitle", comment: ""))
                }
            default:
                break
            }
        }
    }
    
    private func generateGameIDIfNeeded(from gameID: String?) -> String {
        if gameID == nil {
            return String.random()
        } else {
            return gameID!
        }
    }
    
    private func saveDataToUserDefaults(_ gameID: String, _ nickname: String) {
        UserDefaultsManager.setData(value: gameID, for: .gameID)
        UserDefaultsManager.setData(value: nickname, for: .nickname)
        UserDefaultsManager.setData(value: true, for: .isAuthorized)
    }
    
}


