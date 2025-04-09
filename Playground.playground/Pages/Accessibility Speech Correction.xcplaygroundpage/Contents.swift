import Foundation

/// Get i18n values
var emailCompanies = "gmail, aol"
var emailCompaniesAccessibility = "g.mail, a.o.l."

/// Convert into arrays
var emailCompaniesArray = emailCompanies.replacingOccurrences(of: " ", with: "").components(separatedBy: ",").filter { !$0.isEmpty }
var emailCompaniesAccessibilityArray = emailCompaniesAccessibility.replacingOccurrences(of: " ", with: "").components(separatedBy: ",").filter { !$0.isEmpty }

/// Get customer email
var emailEntered = "danny@gmail.com"

/// Loop email companies that don't read out correctly and replace
var count = 0
for _ in emailCompaniesArray {
    print("\(count) \(emailCompaniesArray[count])")
    print("\(count) \(emailCompaniesAccessibilityArray[count])")
    
    emailEntered = emailEntered.replacingOccurrences(of: emailCompaniesArray[count], with: emailCompaniesAccessibilityArray[count])
    print(emailEntered)
    
    count = count + 1
}
