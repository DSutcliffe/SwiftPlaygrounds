protocol FirstProtocol {
    var firstProtocolVar: String { get }
    
    func firstProtocolFunc()
}

/// SecondProtocol inherits from FirstProtocol
protocol SecondProtocol: FirstProtocol {
    var secondProtocolVar: String { get }
    
    func secondProtocolFunc()
}

class FirstClass: FirstProtocol {
    var firstProtocolVar = "first Protocol Var"
    
    func firstProtocolFunc() {
        print("In firstProtocolFunc!")
    }
}

/// Because FirstClass conforms to FirstProtocol, by SecondClass inheriting from FirstClass there is no need to re-conform in this class
class SecondClass: FirstClass, SecondProtocol {
    var secondProtocolVar = "second Protocol Var"
    
    func secondProtocolFunc() {
        print("In secondProtocolFunc!")
        
        /// We are able to use firstProtocolFunc() from FirstClass
        firstProtocolFunc()
    }
}

let test = SecondClass()
test.secondProtocolFunc()
