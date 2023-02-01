import UIKit

let myString = "Hello %s"
let userName = "Danny"
var informationText: String {
    String.init(format: myString.replacingOccurrences(of: "%s", with: "%@"), userName)  // %@ uses the next value somehow???
}

print(informationText)
