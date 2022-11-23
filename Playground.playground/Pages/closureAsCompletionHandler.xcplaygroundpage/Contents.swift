typealias completion = (Bool) -> Void

// Create a function that sets a "completion" value
func fetchI18File(completion: @escaping completion) {
    let e1 = 11
    
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
