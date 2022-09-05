/// https://www.youtube.com/watch?v=fVF_tNcIhfc
func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filterNumbers = [Int]()
    
    for num in numbers {
        if closure(num) {
            filterNumbers.append(num)
        }
    }
    return filterNumbers
}

let filteredList1 = filterWithPredicateClosure(closure: { (num) in
    return num > 2
}, numbers: [1, 2, 3, 4, 5, 10])
print("[H] \(filteredList1)")

func greaterThanTwo(value: Int) -> Bool {
    return value > 2
}

func divisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}

let filteredList2 = filterWithPredicateClosure(closure: greaterThanTwo, numbers: [1, 2, 3, 4, 5, 10])
print("[H] \(filteredList2)")

let filteredList3 = filterWithPredicateClosure(closure: divisibleByFive, numbers: [1, 2, 3, 4, 5, 10])
print("[H] \(filteredList3)")
