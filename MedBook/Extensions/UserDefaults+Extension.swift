//
//  UserDefaults+Extension.swift
//  MedBook
//
//  Created by Raj Raval on 12/10/23.
//

import Foundation

enum UserDefaultKey: String {
    case countryResponse
    case isLoggedIn
}

extension UserDefaults {
    
    func set(_ value: Any, for key: UserDefaultKey) {
        self.set(value, forKey: key.rawValue)
    }
    
    func bool(for key: UserDefaultKey) -> Bool {
        return self.bool(forKey: key.rawValue)
    }
    
    func data(for key: UserDefaultKey) -> Data? {
        return self.data(forKey: key.rawValue)
    }
    
    func string(for key: UserDefaultKey) -> String? {
        return self.string(forKey: key.rawValue)
    }
    
    func integer(for key: UserDefaultKey) -> Int? {
        return self.integer(forKey: key.rawValue)
    }
    
    func float(for key: UserDefaultKey) -> Float? {
        return self.float(forKey: key.rawValue)
    }
    
    func url(for key: UserDefaultKey) -> URL? {
        return self.url(forKey: key.rawValue)
    }
    
    func value(for key: UserDefaultKey) -> Any? {
        return self.value(forKey: key.rawValue)
    }
}
