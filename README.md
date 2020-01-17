# DefaultsWrapper
A try to use custom DefaultsKeys with SwiftyUserDefaults.Defaults

```swift
// default keys
extension DefaultsKeys {
    static var defaultValue: DefaultsKey<String> { .init("defaultValue", defaultValue: "x") }
    static var defaultOptionalValue: DefaultsKey<String?> { .init("defaultOptionalValue") }
}

// custom keys
extension GroupDefaultsKey {
    static var groupDefaultValue: GroupDefaultsKey<String> { .init("groupDefaultValue", defaultValue: "x") }
    static var groupOptionalDefaultValue: GroupDefaultsKey<String?> { .init("groupOptionalDefaultValue") }
}

// override SwiftyUserDefaults.Defaults
let Defaults = DefaultsWrapper.shared

// use `Defaults` as usually do
Defaults[.defaultValue] = "d"
Defaults[.defaultOptionalValue] = "od"
Defaults[.defaultOptionalValue] = nil
Defaults[.defaultOptionalValue] = "odx"

Defaults[.groupDefaultValue] = "g"
Defaults[.groupOptionalDefaultValue] = "og"
Defaults[.groupOptionalDefaultValue] = nil
Defaults[.groupOptionalDefaultValue] = "ogx"
```
