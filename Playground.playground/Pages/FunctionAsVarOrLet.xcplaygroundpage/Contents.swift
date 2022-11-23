import UIKit

/// 01
func greetUser() {
    print("01: Hi there!")
}

greetUser()

var greetCopy = greetUser   // greetCopy is now a funtion () -> Void - We are taking a copy of the funtion greetUser
print(greetCopy)
greetCopy()

///
print("\n")

/// 02
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "02: Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

///
print("\n")

/// 03
