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


// CoopLoginViewController
// #98

viewModel.showSessionEndedScreen = {
    self.showSessionEndedScreen()
}

func showSessionEndedScreen() {
    if let window = UIApplication.shared.delegate?.window as? UIWindow {
        let viewModel = SessionEndedViewModel()
        let viewController = SessionEndedViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}


// RejectLoginViewModel
// #62

if let window = UIApplication.shared.delegate?.window as? UIWindow {
    let viewModel = SessionEndedViewModel()
    let viewController = SessionEndedViewController(viewModel: viewModel)
    let navController = UINavigationController(rootViewController: viewController)
    window.rootViewController = navController
    window.makeKeyAndVisible()
}



func rejectConsent(completion: (() -> Void)?) {
    ConsentAcceptOrRejectRestClient().consentReject(consentChallenge: CoopOpenBankingData.Common.consentChallengeToken) { [weak self] result in
        switch result {
        case .success(let data):
            CoopOpenBankingData.Common.redirectToTPPUrl = data.redirect_to
            completion?()
        case .failure:
//                self?.handleErrors(with: error, isRejected: true)   // TODO: navigate to error screen implemented in MSPR-81
            self?.stopLoader()
            self?.group.leave()
        }
    }
}

private func handleErrors(with restClientErrors: RestClientError, isRejected: Bool) {
    switch restClientErrors {
    case .error503, .error401:
        let message = String(format: ConsentAssets().returnToTPPOrMobileBankingMessage.replacingOccurrences(of: "%s", with: "%@"), CoopOpenBankingData.Common.cbpiiTradingName())
        showErrorAlert?(ConsentAssets().sessionEndedErrorTitle, message, ConsentAssets().continueToMobileBanking, .continueToMobileBanking)
//        case .offline:
//            showErrorAlert?(ConsentAssets().errorTitle, ConsentAssets().noInternetErrorMessage, ConsentAssets().backCTATitle, .none)
    default:
        if isRejected {
            self.delegate?.navigateToSessionEndedScreen()
        }
//            } else {
//                let alertMessage = String(format: ConsentAssets().returnToTPPErrorMessage.replacingOccurrences(of: "%s", with: "%@"), CoopOpenBankingData.Common.cbpiiTradingName())
//                let alertActionCTA = String(format: ConsentAssets().returnToTPPErrorCTATitle.replacingOccurrences(of: "%s", with: "%@"), CoopOpenBankingData.Common.cbpiiTradingName())
//                showErrorAlert?(ConsentAssets().errorTitle, alertMessage, alertActionCTA, .returnToTPP)
//            }
    }
