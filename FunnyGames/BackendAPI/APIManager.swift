//
//  APIManager.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation
import FirebaseFirestore

class APIManager {
    
    static let shared = APIManager()
    let collection = Firestore.firestore().collection(APIKeys.newGame.rawValue)
    
    public func addNewGame(gameID: String, nickName: String, completion: @escaping (APIResult) -> ())  {
        collection.addDocument(data: [APIKeys.gameID.rawValue: gameID, APIKeys.nickname.rawValue: [nickName]]) { error in
            if error != nil {
                completion(.failure(.unknown))
            } else {
                completion(.success)
            }
        }
    }
    
    public func addNewMemberToExistingGame(gameID: String?, nickname: String, completion: @escaping (APIResult) -> ())  {
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
    
    private func writeData(for documentID: String, for member: APIKeys.RawValue, nickname: String, completion: @escaping (APIResult) -> ()) {
        collection.document(documentID).setData([member: nickname], merge: true, completion: { error in
            if error != nil {
                completion(.failure(.unknown))
            } else {
                completion(.success)
            }
        })
    }
    
    public func addSnapshotListener(for gameID: String, completion: @escaping (APIResult) -> ())  {
        collection.whereField(APIKeys.gameID.rawValue, isEqualTo: gameID).addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                completion(.failure(.unknown))
                return
            }
            for document in snapshot.documents {
                completion(.recievedData(document.data()[APIKeys.nickname.rawValue]))
            }
        }
    }
    
}
