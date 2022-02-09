//
//  UserDefaults.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 06.02.2022.
//

import Foundation

class UserDefaultsManager {
    
    static func setData<T>(value: T, for key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    static func getData<T>(type: T.Type, for key: UserDefaultKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: key.rawValue) as? T
        return value
    }
    
    static func removeData(for key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
    
}
