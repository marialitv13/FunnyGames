//
//  APIResult.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 08.02.2022.
//

import Foundation

enum APIResult {
   case success
   case failure(FailureType)
}

enum FailureType {
    case unknown
    case wrongId
    case tooManyMembers
}
