// Higher Order Functions
struct User {
    var name: String
    var age: Int
}

// MAP 1
let numbers = [1, 2, 3, 4, 5,6]
/// 1.1. Use a for...in loop
var doubleNumbers: [Int] = []
for number in numbers {
    doubleNumbers.append(number * 2)
}
print("Map 1.1. \(doubleNumbers)")

/// 1.2.  Use map
var doubleNumbersMapA = numbers.map { number -> Int in
    return number * 2
}
print("Map 1.2. \(doubleNumbersMapA)")

/// Variation 1.1
var doubleNumbersMapB = numbers.map { number -> Int in
    number * 2
}
print("Map 1.3. \(doubleNumbersMapB)")

/// Variation 1.2
var doubleNumbersMapC = numbers.map { number in
    number * 2
}
print("Map 1.4. \(doubleNumbersMapC)")

/// Variation 1.3
var doubleNumbersMapD = numbers.map { $0 * 2 }
print("Map 1.5. \(doubleNumbersMapD)")


// MAP 2
let pairs = [[1, 5], [7, 9], [11, 15]]
/// 2.1 Map to add same sized arrays in an array
var sumsA = pairs.map { pair in
    pair[0] + pair[1]
}
print("Map 2.1. \(sumsA)")

/// Variation 2.2
var sumsB = pairs.map { $0[0] + $0[1] }
print("Map 2.2. \(sumsB)")


// MAP 3
let groups = [[1, 3, 9, 11], [5, 7]]
/// 3.1 Map to add different sized arrays in an array
var groupSumA = groups.map { group -> Int in
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
let intValuesA = stringValues.map { value -> Int? in
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
let users5 = [
    User(name: "Curly", age: 15),
    User(name: "Larry", age: 18),
    User(name: "Moe", age: 18)]
/// 5.1 Create an array of user names only
let names = users5.map { $0.name }
print("Map 5.1. \(names)")


// MAP 6 - Dictionary
let tempAvgC: [String: Double] = ["Spring" : 13, "Summer" : 22, "Autumn" : 14, "Winter" : 7]
/// 6.1
let tempAvgFA = tempAvgC.map { (season, temp) in
    [season: temp * 9 / 5 + 32]
}
print("Map 6.1. \(tempAvgFA)")

/// 6.2
let tempAvgFB = tempAvgC.map { [$0 : $1 * 9 / 5 + 32] }
print("Map 6.2. \(tempAvgFB)")


// MAP 7 - Dictionary
let dataDict: [String: Int] = ["Curly" : 18, "Larry" : 22, "Moe" : 7]
/// 7.1
var users71 = dataDict.map { (key, value) -> User in
    User(name: key, age: value)
}
print("Map 7.1. \(users71)")

/// 7.2
var users72 = dataDict.map { User(name: $0, age: $1) }
print("Map 7.1. \(users72)")


// MAP 8 - Set
let fahrTemps: Set = [-40, 0, 32, 90, 212]
/// 8.1
let celsTempsA = fahrTemps.map { ($0 - 32) * 5 / 9 }    // [Int]
print("Map 8.1. \(celsTempsA)")

/// 8.2
let celsTempsB = Set(fahrTemps.map { ($0 - 32) * 5 / 9 })   // Set<Int>
print("Map 8.2. \(celsTempsB)")


// COMPACT MAP 9 - Receive an array of non-optional values instead of nil coalescing
let stringValues9 = ["1", "two", "3", "4", "five"]
/// 9.1
let intValuesX = stringValues9.map { Int($0) }
print("CompactMap 9.1. \(intValuesX)")

/// 9.2
let intValuesY = stringValues9.compactMap { Int($0) }
print("CompactMap 9.2. \(intValuesY)")


// FLAT MAP 10 - Single level collection
let groups10 = [[1, 3, 9, 11], [5, 7]]
/// 10.1
let flatValues = groups10.flatMap { $0 }
print("FlatMap 10 \(flatValues)")
