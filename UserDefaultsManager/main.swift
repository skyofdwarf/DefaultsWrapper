//
//  main.swift
//  UserDefaultsManager
//
//  Created by kimyj on 17/01/2020.
//  Copyright © 2020 kimyj. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

// defines keys
extension DefaultsKeys {
    static var defaultValue: DefaultsKey<String> { .init("defaultValue", defaultValue: "x") }
    static var defaultOptionalValue: DefaultsKey<String?> { .init("defaultOptionalValue") }
}

extension GroupDefaultsKey {
    static var groupDefaultValue: GroupDefaultsKey<String> { .init("groupDefaultValue", defaultValue: "x") }
    static var groupOptionalDefaultValue: GroupDefaultsKey<String?> { .init("groupOptionalDefaultValue") }
}

extension GroupDefaultsKey_class {
    static var structDefaultValue: GroupDefaultsKey_class<String> { .init("groupDefaultValue_class", defaultValue: "x") }
    static var structOptionalDefaultValue: GroupDefaultsKey_class<String?> { .init("groupOptionalDefaultValue_class") }
}

// overrides SwiftyUserDefaults.Defaults
let Defaults = DefaultsWrapper.shared

// test data
let defaultValue = "defaultValue-value"
let defaultOptionalValue = "defaultOptionalValue-value"

let groupDefaultValue = "groupDefaultValue-value"
let groupOptionalDefaultValue = "groupOptionalDefaultValue-value"

let structDefaultValue = "structDefaultValue-value"
let structOptionalDefaultValue = "structDefaultOptionalValue-value"

func setup() {
    Defaults[.defaultValue] = defaultValue
    Defaults[.defaultOptionalValue] = defaultOptionalValue
    
    Defaults[.groupDefaultValue] = groupDefaultValue
    Defaults[.groupOptionalDefaultValue] = groupOptionalDefaultValue
    
    Defaults[.structDefaultValue] = structDefaultValue
    Defaults[.structOptionalDefaultValue] = structOptionalDefaultValue
}

func test() {
    assert(UserDefaults.standard[.defaultValue] == defaultValue)
    assert(UserDefaults.standard[.defaultOptionalValue] == defaultOptionalValue)
    
    assert(Defaults[.groupDefaultValue] == groupDefaultValue)
    assert(Defaults[.groupOptionalDefaultValue] == groupOptionalDefaultValue)
    
    assert(Defaults[.structDefaultValue] == structDefaultValue)
    assert(Defaults[.structOptionalDefaultValue] == structOptionalDefaultValue)
}

setup()
test()


