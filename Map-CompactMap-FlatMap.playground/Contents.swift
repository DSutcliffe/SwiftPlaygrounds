// Higher Order Functions

// MAP 1
let numbers = [1, 2, 3, 4, 5,6]
/// 1.1. Use a for...in loop
var doubleNumbers: [Int] = []
for number in numbers {
    doubleNumbers.append(number * 2)
}
print("Map 1.1. \(doubleNumbers)")

/// 1.2.  Use map
var doubleNumbersMapA = numbers.map { (number) -> Int in
    return number * 2
}
print("Map 1.2. \(doubleNumbersMapA)")

/// Variation 1.1
var doubleNumbersMapB = numbers.map { (number) -> Int in
    number * 2
}
print("Map 1.3. \(doubleNumbersMapB)")

/// Variation 1.2
var doubleNumbersMapC = numbers.map { (number) in
    number * 2
}
print("Map 1.4. \(doubleNumbersMapC)")

/// Variation 1.3
var doubleNumbersMapD = numbers.map { $0 * 2 }
print("Map 1.5. \(doubleNumbersMapD)")


// MAP 2
let pairs = [[1, 5], [7, 9], [11, 15]]
/// 2.1 Map to add same sized arrays in an array
var sumsA = pairs.map { (pair) in
    pair[0] + pair[1]
}
print("Map 2.1. \(sumsA)")

/// Variation 2.2
var sumsB = pairs.map { $0[0] + $0[1] }
print("Map 2.2. \(sumsB)")


// MAP 3
let groups = [[1, 3, 9, 11], [5, 7]]
/// 3.1 Map to add different sized arrays in an array
var groupSumA = groups.map { (group) -> Int in
    var sum = 0
    for num in group {
        sum += num
    }
    return sum
}
print("Map 3.1. \(groupSumA)")


// MAP 4
let stringValues = ["1", "two", "3", "4", "five"]
/// 4.1 Convert to Integer Value
let intValuesA = stringValues.map { (value) -> Int? in
    Int(value)
}
print("Map 4.1. \(intValuesA)")

/// Variation 4.2
let intValuesB = stringValues.map { Int($0) }
print("Map 4.2. \(intValuesB)")

/// Variation 4.3
let intValuesC = stringValues.map { Int($0) ?? -1 } // assign value to nil items (nil coalescer)
print("Map 4.3. \(intValuesC)")


// MAP 5
struct User {
    var name: String
    var age: Int
}
let users = [
    User(name: "Curly", age: 15),
    User(name: "Larry", age: 18),
    User(name: "Moe", age: 18)]
/// 5.1 Create an array of user names only
let names = users.map { $0.name }
print("Map 5.1. \(names)")
