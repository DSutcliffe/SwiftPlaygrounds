import UIKit

import PlaygroundSupport                                // Code to make asynchronous code work in playground #1
PlaygroundPage.current.needsIndefiniteExecution = true  // Code to make asynchronous code work in playground #2

/// A Completion Handler (or Completion Block) is a block of code that will be executed after the main task is completed!

/// ************************************************************************************************************************************
/// Completion Handler in its simplest form
/// ************************************************************************************************************************************
// 1. Create a function that uses a Completion Handler
func functionWithCompletionHandler(completion: @escaping (String) -> Void) {
    // 3. Code is executed
    let textString: String = "Hello, World!"
    // 4. "completion()" is called passing the string as that is the required parameter type "(String) -> Void"
    completion(textString)
}

// 2. Code Calls a function that has a Completion Handler
functionWithCompletionHandler { anyNameToRepresentAParameterYouExpectFromTheCompletionHandler in
    // 5. "completion()" from the called function provides "textString"
    print(anyNameToRepresentAParameterYouExpectFromTheCompletionHandler)
}
/// ====================================================================================================================================
///
/// ====================================================================================================================================

/// ************************************************************************************************************************************
/// 01: SampleFunction1 will run the two print statements in the wrong order due to the time delay of the DispatchQueue
/// ************************************************************************************************************************************
//func sampleFunction1() {
//    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//        print("SF1: Response from delayed sample function")
//    }
//    print("SF1: After the response from the delayed sample function")
//}
//
//sampleFunction1()
/// ====================================================================================================================================
/// SF1: After the response from the delayed sample function
/// ====================================================================================================================================

/// ************************************************************************************************************************************
/// 02: By adding a completion handler the completion block will run once DispatchQueue has completed ie. after 2 seconds the completion block will execute
/// ************************************************************************************************************************************
//func sampleFunction2(completion: @escaping () -> Void) {
//    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//        print("SF2: Response from delayed sample function")
//        completion()
//    }
//}
//
//sampleFunction2(completion: {
//    print("SF2: After the response from the delayed sample function")
//})
///// When the completion handler is the last parameter or last argument (trailing closure) of a function, we can eliminate the argument label
//sampleFunction2 {
//    print("SF2: After the response from the delayed sample function")
//}
/// ====================================================================================================================================
/// SF2: Response from delayed sample function
/// SF2: After the response from the delayed sample function
/// ====================================================================================================================================

/// ************************************************************************************************************************************
/// 03: Passing in a string argument
/// ************************************************************************************************************************************
//func sampleFunction3(completion: @escaping (String) -> Void) {
//    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//        print("SF3: Response from delayed sample function")
//        completion("SF3: After the response from the delayed sample function")
//    }
//}
//
//sampleFunction3 { response in
//    print(response)
//}
/// ====================================================================================================================================
/// SF3: Response from delayed sample function
/// SF3: After the response from the delayed sample function
/// ====================================================================================================================================

/// ************************************************************************************************************************************
/// 04: Passing in a string argument and a string for the main function
/// ************************************************************************************************************************************
func sampleFunction4(searchString: String, completion: @escaping (String) -> Void) {
    print("SF4: You are about to search for \(searchString)")
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
        completion("SF4: \(searchString): Best programming language.")
    }
}

sampleFunction4(searchString: "Swift") { response in
    print(response)
}
/// ====================================================================================================================================
/// SF4: You are about to search for Swift
/// SF4: Swift: Best programming language.
/// ====================================================================================================================================
