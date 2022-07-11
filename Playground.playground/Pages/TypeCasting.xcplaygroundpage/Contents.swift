class Animal {
    var string = "This is the Animal String"
}

class Dog: Animal {
    var name = "Spot"
}

class Cat: Animal {
    var name = "Mog"
}

let animal1: Animal = Dog()
//animal1 as Dog          // now raises the error:  "'Animal is not convertible to 'Dog';
//                        // ... did you mean to use 'as!' to force downcast?"

animal1 as! Dog         // forced downcast is allowed
print(animal1.string)   // CAN access Animal variables
//print(animal1.name)     // Cannot access Dog variables

let animal2 = Dog()
animal2 as Animal       // upcast succeeds
print(animal2.string)   // CAN access Animal variables
print(animal2.name)     // CAN Access Dog variables

let dog1: Dog? = nil
dog1?.name              // evaluates to nil
//dog1!.name              // triggers a runtime error

let animal3: Animal = Cat()
animal3 as? Dog         // evaluates to nil
//animal3 as! Dog         // triggers a runtime error

// **********************
// **********************

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

// **********************
// **********************

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

