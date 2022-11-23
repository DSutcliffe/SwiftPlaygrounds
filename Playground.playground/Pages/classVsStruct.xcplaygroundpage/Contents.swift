// https://www.youtube.com/watch?v=3ox38NBBiNM
// Class - Reference Type (Google Sheet - Shared Edit)

class DeveloperClass {
    var name: String?
    var jobTitle: String?
    var yearsExp: Int?
    
    init(name: String, jobTitle: String, yearsExp: Int) {
        self.name = name
        self.jobTitle = jobTitle
        self.yearsExp = yearsExp
    }
}

var dannyClass = DeveloperClass(name: "Danny", jobTitle: "iOS Engineer", yearsExp: 2)
var jayClass = dannyClass       // jayClass uses the original dannyClass

jayClass.name = "Jay"

jayClass.name
dannyClass.name

// Struct - Value Type (Excel Sheet - Individual Copy)
// Structs dont have inheritence!, Cant subClass

struct DeveloperStruct {
    var name: String?
    var jobTitle: String?
    var yearsExp: Int?
    
    init(name: String, jobTitle: String, yearsExp: Int) {
        self.name = name
        self.jobTitle = jobTitle
        self.yearsExp = yearsExp
    }
}

var dannyStruct = DeveloperStruct(name: "Danny", jobTitle: "iOS Engineer", yearsExp: 2)
var jayStruct = dannyStruct     // a copy of dannyStruct gets created and assigned to jayStruct

jayStruct.name = "Jay"

jayStruct.name
dannyStruct.name
