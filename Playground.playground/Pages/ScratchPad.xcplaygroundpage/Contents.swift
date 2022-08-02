/// ************************************************************************************************************************************
/// 01.
/// ************************************************************************************************************************************
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)
/// ************************************************************************************************************************************

/// ************************************************************************************************************************************
/// 02.
/// ************************************************************************************************************************************
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "Bob"
var user3 = user1.copy()
user3.username = "Taylor"   // updates the copy rather than the class!

print(user1.username)
print(user2.username)
print(user3.username)
/// ************************************************************************************************************************************
