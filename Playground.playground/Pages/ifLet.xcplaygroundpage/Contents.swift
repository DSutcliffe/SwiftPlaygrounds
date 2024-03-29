/// ************************************************************************************************************************************
/// 01. If Let contains a value
/// ************************************************************************************************************************************
var optionalName1: String? = "John Appleseed"
var greeting1 = "Hello!"
if let name = optionalName1 {
    greeting1 = "Hello, \(name)"
}

print(greeting1)

/// ************************************************************************************************************************************
/// 02. If let = nil
/// ************************************************************************************************************************************
var optionalName2: String?
var greeting2 = "Hello!"
if let name = optionalName2 {
    greeting2 = "Hello, \(name)"    // only applies value when if let is != nil
}

print(greeting2)
