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




