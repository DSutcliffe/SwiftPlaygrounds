// Retain Cycle - Memory Leak

import Foundation

class Course {
    private var students = [Student]()
    
    init() { print("Course initialised") }
    deinit { print("Course de-initialised") }
    
    func enroll(_ student: Student) {
        students.append(student)
    }
}

class Student {
    private var course: Course?         // If the reference is not set to weak, a STRONG reference is retained and so nothing gets de-initialised
//    private weak var course: Course?    // WEAK reference allows classes to be de-initialised
    private var name: String
    
    init(course: Course, name: String) {
        print("Student initialised")
        self.course = course
        self.name = name
    }
    
    deinit { print("Student de-initialised") }
}

var computerScience: Course? = Course()                                 // A Course() reference gets initialised
var danny: Student? = Student(course: computerScience!, name: "Danny")  // A Student() reference gets initialised

computerScience?.enroll(danny!) // Example of when a student enrolls

computerScience = nil   // Should de-initialise computerScience Course() reference
danny = nil             // Should de-initialise danny Student() reference
