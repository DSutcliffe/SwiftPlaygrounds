/// Starting Example
func calculator(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

calculator(n1: 2, n2: 3)

/// Step 1
func calculator1(n1: Int, n2: Int) -> Int {
    return n1 * n2
}

/// Below function represents (Int, Int) -> Int
func add1(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

calculator1(n1: 2, n2: 3)

/// Step 2
/// Add function added as an input called Operation
/// Able to pass a function as an input
func calculator2(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

func add2(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

calculator2(n1: 2, n2: 3, operation: add2)

/// Step 3
/// Closures are Anonymus Functions
func add3(no1: Int, no2: Int) -> Int {
    return no1 + no2
}
/// Replace the "func" keyword and function name "add3" with a "{"
/// Replace the original "{" with the keyword "in"
//{ (no1: Int, no2: Int) -> Int in
//    return no1 + no2
//}

/// Step 4
func calculator4(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

/// Instead of using the function name we can pass in a Closure
calculator4(n1: 2, n2: 3, operation: { (no1: Int, no2: Int) -> Int in
    return no1 + no2
})

/// Step 5
/// Infer data type / type inference
func calculator5(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

/// If you pass an intergar Swift will infer that the type is an Int
/// Data type has an output based on the inputs so the return can be removed also
calculator5(n1: 2, n2: 3, operation: { (no1, no2) in
/// Because we are inside a closure and there is an operation being carried out, the complier can infer that we want something to be returned
    no1 + no2
})

/// Step 6
/// Closures are able to provide anonymus paramater names - $0 = 1st param, $1 = 2nd param....
func calculator6(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

let result6 = calculator6(n1: 2, n2: 3, operation: { $0 + $1 })
print(result6)

/// Step 7
/// Rule, If the last parameter in your function is a closure, you can elimante the last paramter name, close the input section and have the closure trailing - Trailing Closure
func calculator7(n1: Int, n2: Int, operation: (Int, Int) -> Int ) -> Int {
    return operation(n1, n2)
}

let result7 = calculator7(n1: 2, n2: 3) { $0 + $1 }
print(result7)
