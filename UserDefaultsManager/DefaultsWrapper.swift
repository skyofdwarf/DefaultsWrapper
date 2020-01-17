//
//  DefaultsWrapper.swift
//  UserDefaultsManager
//
//  Created by kimyj on 17/01/2020.
//  Copyright © 2020 kimyj. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

class DefaultsWrapper {
    static let shared = DefaultsWrapper()
    
    let groupDefaults: UserDefaults = {
        let suiteName = "group-defaults-name"
        guard let ud = UserDefaults(suiteName: suiteName) else {
            fatalError("Could not create a UserDefaults with suite name: \(suiteName)")
        }
        return ud
    }()

    subscript<T: DefaultsSerializable>(key: DefaultsKey<T?>) -> T.T? {
        get {
            return UserDefaults.standard[key]
        }
        set {
            UserDefaults.standard[key] = newValue
        }
    }

    subscript<T: DefaultsSerializable>(key: DefaultsKey<T>) -> T.T where T.T == T {
        get {
            return UserDefaults.standard[key]
        }
        set {
            UserDefaults.standard[key] = newValue
        }
    }
    
    subscript<T: DefaultsSerializable>(key: GroupDefaultsKey<T?>) -> T.T? {
        get {
            return groupDefaults[key.defaultKey]
        }
        set {
            groupDefaults[key.defaultKey] = newValue
        }
    }

    subscript<T: DefaultsSerializable>(key: GroupDefaultsKey<T>) -> T.T where T.T == T {
        get {
            return groupDefaults[key.defaultKey]
        }
        set {
            groupDefaults[key.defaultKey] = newValue
        }
    }
    
    subscript<T: DefaultsSerializable>(key: GroupDefaultsKey_class<T?>) -> T.T? {
        get {
            return groupDefaults[key.defaultKey]
        }
        set {
            groupDefaults[key.defaultKey] = newValue
        }
    }

    subscript<T: DefaultsSerializable>(key: GroupDefaultsKey_class<T>) -> T.T where T.T == T {
        get {
            return groupDefaults[key.defaultKey]
        }
        set {
            groupDefaults[key.defaultKey] = newValue
        }
    }
}
