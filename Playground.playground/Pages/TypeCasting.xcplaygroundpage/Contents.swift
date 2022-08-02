/// ************************************************************************************************************************************
/// https://developer.apple.com/swift/blog/?id=23
/// ************************************************************************************************************************************
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
/// ************************************************************************************************************************************
