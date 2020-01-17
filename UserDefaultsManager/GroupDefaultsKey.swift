//
//  GroupDefaultsKey.swift
//  UserDefaultsManager
//
//  Created by kimyj on 17/01/2020.
//  Copyright © 2020 kimyj. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

public struct GroupDefaultsKey<ValueType: DefaultsSerializable> {
    let key: String
    let defaultValue: ValueType.T?

    init(_ key: String, defaultValue: ValueType.T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

public extension GroupDefaultsKey where ValueType: ExpressibleByNilLiteral {
    init(_ key: String) {
        self.key = key
        self.defaultValue = nil
    }
}

public extension GroupDefaultsKey {
    var defaultKey: DefaultsKey<ValueType> {
        guard let defaultValue = defaultValue else {
            preconditionFailure("Non optional DefaultsKey must have a default value")
        }
        
        return DefaultsKey<ValueType>(key, defaultValue: defaultValue)
    }
}

public extension GroupDefaultsKey where ValueType: OptionalType, ValueType.Wrapped: DefaultsSerializable {
    var defaultKey: DefaultsKey<ValueType> {
        return DefaultsKey<ValueType>(key)
    }
}
