//
//  GroupDefaultsKey_class.swift
//  UserDefaultsManager
//
//  Created by kimyj on 17/01/2020.
//  Copyright © 2020 kimyj. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

/// Test implementation using class
///
/// On class, providing intiailizer for nilable generics type is so dirty than struct.
/// And a subclass of this is not work properly with nilable generic type.
open class GroupDefaultsKey_class<ValueType: DefaultsSerializable> {
    let key: String
    let defaultValue: ValueType.T?

    fileprivate init(key: String, defaultValue: ValueType.T?) {
        self.key = key
        self.defaultValue = defaultValue
    }

    convenience init(_ key: String, defaultValue: ValueType.T) {
        self.init(key: key, defaultValue: defaultValue)
    }
}

public extension GroupDefaultsKey_class where ValueType: ExpressibleByNilLiteral {
    convenience init(_ key: String) {
        self.init(key: key, defaultValue: nil)
    }
}

public extension GroupDefaultsKey_class {
    var defaultKey: DefaultsKey<ValueType> {
        guard let defaultValue = defaultValue else {
            preconditionFailure("Non optional DefaultsKey must have a default value")
        }
        
        return DefaultsKey<ValueType>(key, defaultValue: defaultValue)
    }
}

public extension GroupDefaultsKey_class where ValueType: OptionalType, ValueType.Wrapped: DefaultsSerializable {
    var defaultKey: DefaultsKey<ValueType> {
        return DefaultsKey<ValueType>(key)
    }
}
