import UIKit
import PlaygroundSupport                                // Code to make asynchronous code work in playground #1
PlaygroundPage.current.needsIndefiniteExecution = true  // Code to make asynchronous code work in playground #2

func whatOrder() {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
        print("A")
    }
    DispatchQueue.main.async {
        print("B")
    }
    print("C")
}

// Doesn't run!?
