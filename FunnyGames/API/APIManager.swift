//
//  APIManager.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation
import FirebaseFirestore

class APIManager {
    
    let collection = Firestore.firestore().collection(APIKeys.newGame.rawValue)
    
    public func createNewGame(gameID: String, nickName: String, completion: @escaping (APIResult) -> ()) {
        collection.addDocument(data: [APIKeys.gameID.rawValue: gameID, APIKeys.nickname.rawValue: [nickName]]) { error in
            if error != nil {
                completion(.failure(.unknown))
            } else {
                completion(.success)
            }
        }
    }
    
    public func addNewMember(for gameID: String?, nickname: String, completion: @escaping (APIResult) -> ()) {
        collection.getDocuments { (snapshot, _) in
            guard let snapshot = snapshot else {
                completion(.failure(.unknown))
                return
            }
            for document in snapshot.documents {
                let oneOfGameIDs = document.data()[APIKeys.gameID.rawValue] as? String
                if oneOfGameIDs == gameID {
                    document.reference.updateData([APIKeys.nickname.rawValue: FieldValue.arrayUnion([nickname])]) { error in
                        if error != nil {
                            completion(.failure(.unknown))
                        } else {
                            completion(.success)
                        }
                    }
                }
            }
        }
    }
    
    public func startGame(gameID: String?, completion: @escaping (APIResult) -> ()) {
        collection.getDocuments { (snapshot, _) in
            guard let snapshot = snapshot else {
                completion(.failure(.unknown))
                return
            }
            for document in snapshot.documents {
                let oneOfGameIDs = document.data()[APIKeys.gameID.rawValue] as? String
                if oneOfGameIDs == gameID {
                    self.collection.document(document.documentID).setData([APIKeys.startGame.rawValue: true], merge: true, completion: { error in
                        if error != nil {
                            completion(.failure(.unknown))
                        } else {
                            completion(.success)
                        }
                    })
                }
            }
        }
    }
    
    public func addSnapshotListener(for gameID: String, for key: APIKeys.RawValue, completion: @escaping (APIResult) -> ())  {
        collection.whereField(APIKeys.gameID.rawValue, isEqualTo: gameID).addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                completion(.failure(.unknown))
                return
            }
            for document in snapshot.documents {
                completion(.recievedData(document.data()[key]))
            }
        }
    }
    
}
