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
    let a = "hell"  // Pretend we have done an API call to get data
    
    if a == "hello" {
        completion("Olla")
    } else {
        completion("Ciao")
    }
}

secondTest { myString in
    if myString == "Olla" {
        print("Olla")
    } else {
        print("Ciao")
    }
}
