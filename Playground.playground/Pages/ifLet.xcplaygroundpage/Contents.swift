var optionalName: String? = "John Appleseed"    // set to nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
