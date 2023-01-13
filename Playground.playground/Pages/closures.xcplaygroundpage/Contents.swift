/// Step 1:
/// Start with a simple function that takes 2 Int's as inputs and returns and Int as an output.
func calculator1(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

func add1(no1: Int, no2: Int) -> Int {      // This function as a type would be: (Int, Int) -> Int
    return no1 + no2
}

calculator1(n1: 2, n2: 3)

/// Step 2:
/// We have now added a 3rd parameter to the "calculator" function that requires a function type equal to the "Add" function in Step 1 (ie. takes 2 Int's as inputs and returns an Int as otput).
func calculator2(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    /// We are now returning the result of the function specified in the "operation" aparameter
    return operation(n1, n2)
}

func add2(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

/// Calling the "calculator" function now requires we supply a function for "operation" parameter. Here, we use the "add" function.
/// So, "calculator" will be called with 2 Int's as inputs (n1 & n2).
/// "calculator" wants to return the result of the call to "operation", that being the "add" function.
/// "opertaion/add" is called and passed the 2 Int's (n1 & n2) from "calculator" call as no1 & no2.
/// "add" returns the sum of no1 + no2 to "calculator".
/// "calculator" returns the result from "operation/add" function it called
calculator2(n1: 2, n2: 3, operation: add2)

/// Step 3:
/// Closures are Anonymus Functions
func add3(no1: Int, no2: Int) -> Int {
    return no1 + no2
}
/// "add" function as a closure would be written as below.
/*
{ (no1: Int, no2: Int) -> Int in
    return no1 + no2
}
*/
/// What we have essentially done here is:
/// Replace the "func" keyword and function name "add3" with a "{"
/// Replace the original "{" with the keyword "in"

/// Step 4:
func calculator4(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}
/// Instead of writing the "add" function we can use the Closure we made in Step 3 created from the "add" func.
calculator4(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 + no2
})

/// Step 5:
/// Infer data type / type inference
func calculator5(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}
/// If you pass an intergar, Swift will infer that the type is an Int
/// Data type has an output based on the inputs (Adding 2 Int's together must return an Int) so the "-> Int" can also be removed.
calculator5(n1: 2, n2: 3, operation: { (no1, no2) in
    /// Because we are inside a closure and there is an operation being carried out, the complier can infer that we want something to be returned and  so "return" can be removed.
    no1 + no2
})

/// Step 6:
/// Closures are able to provide anonymus paramater names - $0 = 1st param, $1 = 2nd param....
func calculator6(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

let result6 = calculator6(n1: 2, n2: 3, operation: { $0 + $1 })
print(result6)

/// Step 7:
/// Rule, If the last parameter in your function is a closure, you can elimante the last paramter name, close the input section and have the closure trailing - Trailing Closure
func calculator7(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

let result7 = calculator7(n1: 2, n2: 3) { $0 + $1 }
print(result7)
