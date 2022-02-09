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
    let database = Firestore.firestore()
    var gameCreatorModeOn: Bool?
    let apiManager = APIManager.shared
    
    func viewLoaded() {
        guard let gameID = UserDefaultsManager.getData(type: String.self, forKey: .gameID) else { return }
        addSnapshotListeners(for: gameID)
        view?.setupInitialState(gameCreatorModeOn ?? false, gameID: gameID)
    }
    
    func addSnapshotListeners(for gameID: String) {
        apiManager.addSnapshotListener(for: gameID, for: APIKeys.nickname.rawValue) { result in
            switch result {
            case .recievedData(let data):
                self.view?.updateView(with: data as? [String])
            default:
                break
            }
        }
        apiManager.addSnapshotListener(for: gameID, for: APIKeys.start.rawValue) { result in
            switch result {
            case .recievedData(let data):
                print("Recieved")
                let data = data as? Bool
                if data == true {
                    print("DATA")
                self.router?.showGameScreen()
                }
            default:
                break
            }
        }
    }
    
    func startButtonTapped() {
        guard let gameID = UserDefaultsManager.getData(type: String.self, forKey: .gameID) else { return }
        APIManager.shared.startGame(gameID: gameID) { result in
            switch result {
            case .success:
                self.router?.showGameScreen()
            default:
                self.view?.showErrorAlert(alertTitle: NSLocalizedString("DefaultAlertTitle", comment: ""))
            }
        }
    }
    
}
