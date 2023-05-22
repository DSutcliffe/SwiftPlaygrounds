// Static & Mutating

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "highest unlocked level is now 2"

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}
// Prints "level 6 hasn't yet been unlocked"




// CLASS
class RectangleClass {
    var width = 2
    var height = 1
    
    func area() -> Int {
        return width * height
    }
    
    func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}

let rectClass1 = RectangleClass()
let rectClass2 = rectClass1

rectClass1.area()
rectClass1.scaleBy(value: 3)
rectClass1.area()
rectClass2.area()

// STRUCT
struct RectangleStruct {
    var width = 2
    var height = 1
    
    func area() -> Int {
        return width * height
    }
    
    mutating func scaleBy(value: Int) {     // Add mutating - self (width & height) is immutable - ie. doesnt allow modifications to vars
        width *= value
        height *= value
    }
}

var rectStruct1 = RectangleStruct()     // Changed to var
var rectStruct2 = rectStruct1           // Changed to var

rectStruct1.area()
rectStruct1.scaleBy(value: 5)   // cannot modify a let constant in the case of a value type. Values never change, variables do
rectStruct1.area()
rectStruct2.area()



import UIKit
import PlaygroundSupport                                // Code to make asynchronous code work in playground #1
PlaygroundPage.current.needsIndefiniteExecution = true  // Code to make asynchronous code work in playground #2


func doSomething() {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
        print("A")
    }
    DispatchQueue.main.async {
        print("B")
    }
    print("C")
}


client_id=35c73fd2-3b92-449d-a8e6-8aca93d702ff&redirect_uri=https://ob.retailonlinedevikscluster-46e544cd60b778e71a17cbb7b32c6e71-0000.eu-gb.containers.appdomain.cloud/ob-test-client/index.html&response_type=code&scope=PISP+offline&state=3nJR8ai76478874928974&login_hint=coop&display=d01509a0-f7cf-4b77-93ff-ec169955fbb7" | base64

https://bank74.co-operativebanktest.co.uk/openbanking/oauthRedirect?data=Y2xpZW50X2lkPTM1YzczZmQyLTNiOTItNDQ5ZC1hOGU2LThhY2E5M2Q3MDJmZiZyZWRpcmVjdF91cmk9aHR0cHM6Ly9vYi5yZXRhaWxvbmxpbmVkZXZpa3NjbHVzdGVyLTQ2ZTU0NGNkNjBiNzc4ZTcxYTE3Y2JiN2IzMmM2ZTcxLTAwMDAuZXUtZ2IuY29udGFpbmVycy5hcHBkb21haW4uY2xvdWQvb2ItdGVzdC1jbGllbnQvaW5kZXguaHRtbCZyZXNwb25zZV90eXBlPWNvZGUmc2NvcGU9UElTUCtvZmZsaW5lJnN0YXRlPTNuSlI4YWk3NjQ3ODg3NDkyODk3NCZsb2dpbl9oaW50PWNvb3AmZGlzcGxheT1kMDE1MDlhMC1mN2NmLTRiNzctOTNmZi1lYzE2OTk1NWZiYjcK
