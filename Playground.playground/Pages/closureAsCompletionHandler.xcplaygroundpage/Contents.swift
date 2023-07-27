typealias completion = (Bool) -> Void

// Create a function that sets a "completion" value
func fetchI18File(completion: @escaping completion) {
    let e1 = 11 // Pretend we have done an API call to get data
    
    if e1 <= 10 {
        completion(true)
    } else {
        completion(false)
    }
}

// Call the function and perform an action based on the completion value
fetchI18File { i18Success in
    if i18Success {
        print("[D] True")
    } else {
        print("[D] False")
    }
}


func secondTest(completion: @escaping (String) -> Void) {
    let apiReturn = "fail"  // Pretend we have done an API call and success/fail returned
//    let apiReturn = "success"
    
    if apiReturn == "success" {
        completion("callSuccessful")
    } else {
        completion("callFailure")
    }
}

secondTest { completionStringReturned in
    // An "API Call" is performed in secondTest function and a value is returned...
    // Based on the value returned from the API call, a string is provided via completion("completionStringReturned")
    
    if completionStringReturned == "callSuccessful" {
        print("API call was successful")
    } else {
        print("API call failed!")
    }
}
