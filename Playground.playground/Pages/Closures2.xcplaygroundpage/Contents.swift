func calculator(calculatorNo1: Int, calculatorNo2: Int, calculatorOperation: (Int, Int) -> Int) -> Int {
    return calculatorOperation(calculatorNo1, calculatorNo2)
}

func add(addNo1: Int, addNo2: Int) -> Int { // function of type: (Int, Int) -> Int
    return addNo1 + addNo2
//    addNo1 + addNo2    // Could write as this as a return is inferred
}

/// Passes "add" as a function
let sumPassingFunctionAsParam = calculator(calculatorNo1: 2, calculatorNo2: 3, calculatorOperation: add)
print ("sumPassingFunctionAsParam: \(sumPassingFunctionAsParam)")

/// Write "add" function as a "trailing" closure (Int, Int) -> Int so "add" funtion not required
let sumUsingAddAsClosure = calculator(calculatorNo1: 2, calculatorNo2: 3) { anyParamName1, anyParamName2 in // These params are what you would use in the function input params (eg. addNo1 & addNo2 above)
    anyParamName1 + anyParamName2   // This is the same code that would be run in the body of a function if that were called instead!
}
print("sumUsingAddAsClosure: \(sumUsingAddAsClosure)")


/// Using anonymous parameters
let sumUsingAddAsClosureAnonParam = calculator(calculatorNo1: 2, calculatorNo2: 3) { $0 + $1 }
print("sumUsingAddAsClosureAnonParam: \(sumUsingAddAsClosureAnonParam)")
