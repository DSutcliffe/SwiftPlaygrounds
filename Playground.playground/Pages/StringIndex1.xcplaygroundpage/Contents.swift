import Foundation
var benName = "ABCDEFGHIJKLMNOPKRS"     // S = 19th char

if benName.count > 18 {
//    let index1 = benName.index(benName.endIndex, offsetBy: -18)
    let index1 = benName.index(benName.startIndex, offsetBy: 18)
    print(index1)
    let output = String(benName[..<index1])
    print(output)
}



var str = "Hello, playground"
//         01234567891111111    17 character string
//                   0123456
// str.startIndex = 0 (1st characters position)
// str.endIndex = 18 (Next position after the last characters position)

/// offsetBy
/// The offsetBy value can be positive or negative and starts from the given index. Although it is of the type String.IndexDistance, you can give it an Int.

// character
let index = str.index(str.startIndex, offsetBy: 7)
str[index]  // p

// range
let start = str.index(str.startIndex, offsetBy: 7)
str[start]
let end = str.index(str.endIndex, offsetBy: -6)
str[end]
let range = start..<end     // from 'start' P to upto but not including 'end' G
str[range]  // play



/// Creating Strings
let aString = "Hello world"
//             01234567891
//                       0
let bString = String("Hello world")

/// Counting number of characters in a string
aString.count
bString.count

/// Getting the first character if a string
aString[aString.startIndex]

/// Getting the last character of a string
aString[aString.index(before: aString.endIndex)]

/// Getting the n'th character of a string
aString[aString.index(aString.startIndex, offsetBy: 10)]

/// Getting the substring of a string to the given index
aString.substring(to: aString.index(aString.startIndex, offsetBy: 10))
aString.substring(from: aString.index(aString.startIndex, offsetBy: 10))

/// Getting the substring for the given range
let rangeX = Range(uncheckedBounds: (lower: aString.startIndex, upper: aString.endIndex))
aString.substring(with: rangeX)

/// Comparing two strings
if aString == bString {
    print("Strings are equal")
}

/// Checking for empty strings
if !aString.isEmpty {
    print("String contains characters")
}

/// Existence check
if aString.contains("Hello") {
    print("Hello is existing in \(aString)")
}

/// Converting strings to numbers
let numberString = "123"
let number = Int(numberString)
let newNumber = (number ?? 0) + 10

/// String mutability
aString.lowercased()
aString.uppercased()
aString.capitalized

if aString.hasPrefix("Hello") {
    print("Hello is prefix")
}

if aString.hasSuffix("world") {
    print("world is suffix")
}

/// String concatenation
var cString = "This is mutable String"
cString = cString + "I am using it"

/// Appending string
cString.append("!")
cString = cString.appending(" Properly")

/// Insert character at given index
cString.insert(".", at: cString.endIndex)

/// Inserting string
cString.insert(contentsOf: " Inserted", at: cString.endIndex)

/// Replacing some range of string with given string
cString.replaceSubrange(cString.startIndex...cString.index(before: cString.endIndex), with: "This is replaced string")

/// Removing specific characters
cString.remove(at: cString.startIndex)
cString

/// Replacing a string
cString.replaceSubrange(cString.range(of: "his")!, with: "This")

/// Seperate string with seperator
let words = cString.components(separatedBy: " ")
let joinedString = words.joined(separator: " ")

/// Remove all characters
cString.removeAll()

