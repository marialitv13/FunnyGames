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
}

class PregamePresenter: PregamePresenterProtocol {
    
    weak var view: PregameViewProtocol?
    var router: PregameRouterProtocol?
    let database = Firestore.firestore()
    
    func viewLoaded() {
        let gameID = UserDefaultsManager.getData(type: String.self, forKey: .gameID)
        view?.setupInitialState(gameID: gameID ?? "")
        let collectionRef = self.database.collection("New game")
        collectionRef.whereField("gameID", isEqualTo: gameID).addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                return
            }
        }
    }
    
}
