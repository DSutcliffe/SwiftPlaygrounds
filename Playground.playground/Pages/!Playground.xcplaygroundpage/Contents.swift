
import UIKit
import Foundation

let bodyText = "Hello\n\nMy\n\nName\n\nIs\n\nDanny"

let bodyTextArray = bodyText.components(separatedBy: "\n\n")
for i in 0..<bodyTextArray.count {
//    let paragraph = UILabel()
//    paragraph.text = bodyTextArray[i]
    print(bodyTextArray[i])
}

let epoch1 = Date().timeIntervalSince1970
let epoch2 = Date().timeIntervalSince1970
let epoch3 = Date().timeIntervalSince1970
var epoch4 = String(Date().timeIntervalSince1970)
let noDecimalEpoch = Int(Date().timeIntervalSince1970)

print(epoch1)
print(noDecimalEpoch)

print(epoch4)
epoch4 = epoch4.description.replacingOccurrences(of: ".", with: "")
let newEpoch4 = epoch4.prefix(13)
print(newEpoch4)

1704452251686
1704729621

//struct Family {
//    let name: String
//    let age: Int
//}
//
//let myArray = [Family(name: "Danny", age: 45),
//               Family(name: "Jo", age: 43),
//               Family(name: "Arthur", age: 9),
//               Family(name: "Mum", age: 76),
//               Family(name: "Dad", age: 76)]
//
//let myFilteredArray = myArray.filter { anyName in
//    guard let abc = anyName.name else { return false }
//    return abc
//}


