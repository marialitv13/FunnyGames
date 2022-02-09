//
//  PregamePresenter.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation
import Firebase

protocol PregamePresenterProtocol {
    func viewLoaded()
    func startButtonTapped()
}

class PregamePresenter: PregamePresenterProtocol {
    
    weak var view: PregameViewProtocol?
    var router: PregameRouterProtocol?
    var gameCreatorModeOn: Bool?
    private let database = Firestore.firestore()
    
    func viewLoaded() {
        guard let gameID = UserDefaultsManager.getData(type: String.self, for: .gameID) else { return }
        addSnapshotListeners(for: gameID)
        view?.setupInitialState(gameCreatorModeOn ?? false, gameID: gameID)
    }
    
    private func addSnapshotListeners(for gameID: String) {
        APIManager().addSnapshotListener(for: gameID, for: APIKeys.nickname.rawValue) { result in
            switch result {
            case .recievedData(let data):
                self.view?.updateView(with: data as? [String])
            default:
                break
            }
        }
        APIManager().addSnapshotListener(for: gameID, for: APIKeys.startGame.rawValue) { result in
            switch result {
            case .recievedData(let data):
                guard let data = data as? Bool else { return }
                if data == true {
                    self.router?.showGameScreen()
                }
            default:
                break
            }
        }
    }
    
    func startButtonTapped() {
        guard let gameID = UserDefaultsManager.getData(type: String.self, for: .gameID) else { return }
        APIManager().startGame(gameID: gameID) { result in
            switch result {
            case .success:
                self.router?.showGameScreen()
            default:
                self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
            }
        }
    }
    
}
