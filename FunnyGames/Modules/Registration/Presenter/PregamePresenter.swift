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
        view?.setupInitialState(gameCreatorModeOn ?? false, gameID: gameID)
        apiManager.addSnapshotListener(for: gameID) { result in
            switch result {
            case .recievedData(let data):
                self.view?.updateView(with: data as? [String])
            default:
                break
            }
        }
    }
    
    func startButtonTapped() {
        router?.showGameScreen()
    }
    
}
