func doSomething(_ numbers: Int...) -> Int? {
    var x = 0
    for number in numbers {
        x += number
    }
    
    if x > 100 {
        return x
    }
    
    return nil
}

doSomething(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
