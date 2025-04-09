/// ************************************************************************************************************************************
/// If & Guard let allow us to unwrap optionals
/// Guard Let is designed to exit current function, loop or condition
/// If Let allows you to use the data at the point of unwrapping - cannot be used later in the code
/// ************************************************************************************************************************************
func getTextFieldData(input: String? = nil) {
    print("\nProcessing Guard Let...")
    guard let dataGuardLet = input else {
        print("Guard Let Data IS NIL and will exit current function")
        return
    }
    
    print("\(dataGuardLet) Not NIL so unwrapped, able to be used within the function and used in this string")
    
    print("\nProcessing If Let...")
    if let dataIfLet = input {
        print("\(dataIfLet) Not NIL so unwrapped and used in this string")
    } else {
        print("If Let Data IS NIL and continues through function")
    }
    
    nextFunction()
}

func nextFunction() {
    print("Moved to next function")
}

getTextFieldData(input: "Text Field Input")
getTextFieldData()
