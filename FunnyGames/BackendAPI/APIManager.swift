//
//  APIManager.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


class APIManager {
    
    static let shared = APIManager()
    let db = Firestore.firestore()
    
    
    
    public func get<T: Decodable>(docId: String, onCompletion: @escaping (T?) -> Void){
            let typeNameStr = String(describing: T.self)
            Firestore.firestore().collection(typeNameStr).whereField("doc_id", isEqualTo: docId).getDocuments() { (query, error) in
                if let error = error {
                    print(error)
                }
                if let query = query {
                    let doc = query.documents.first
                    let result = Result {
                        try doc.flatMap {
                            try $0.data(as: T.self)
                        }
                    }
                    switch  result {
                    case .success(let doc):
                        if let doc = doc {
                            onCompletion(doc)
                        } else {
                            onCompletion(nil)
                        }
                    default:
                       onCompletion(nil)
                    }
                }
            }
        }

}
