//
//  String.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import Foundation

extension String {
    
    static func random(length: Int = 4) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
}
