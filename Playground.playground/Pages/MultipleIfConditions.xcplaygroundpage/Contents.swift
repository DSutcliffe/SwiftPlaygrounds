import Foundation

var isUKNationality: Bool? = false
//var countryOfNationality: String? = "Zimbabwae"
var countryOfNationality: String?

/// Multiple conditions in If Let separated by ","
if let nationality = isUKNationality, !nationality, countryOfNationality == nil {
    print(nationality)
    print(countryOfNationality)
    print("In If")
} else {
    print("In Else")
}


func isLeapYear(year: Int) -> Bool {
    switch (year) {
    case let x where (x % 100) == 0 && (x % 400) != 0:
        print("Case 1: \(year), \(x)")
        break
    case let x where (x % 4) == 0:
        print("Case 2: \(year), \(x)")
        return true
    default:
        print("Default: \(year)")
        break
    }
    print("Outside Switch: \(year)")
    return false
}

isLeapYear(year: 2014)    // false
isLeapYear(year: 2000)    // true
isLeapYear(year: 1900)    // false
