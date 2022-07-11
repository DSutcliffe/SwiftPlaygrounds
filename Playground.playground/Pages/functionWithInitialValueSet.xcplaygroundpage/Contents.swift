func danTest(preSetValue: Bool = false) {
    print("[H] \(preSetValue)")
}

danTest()                       // Prints: false
danTest(preSetValue: true)      // Prints: true
