import Foundation

class Person {
    var name: String
    var age: Int

    var isAdult: Bool {
        return age >= 18
    }
    
    static let minAgeForEnrollment = 16
    
    lazy var profileDescription: String = {
        return "\(name) is \(age) years old."
    }()

    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init?(name: String, failableAge age: Int) {
        if age <= 16 {
            return nil
        }
        self.init(name: name, age: age)
    }
}

class Student: Person {
    var studentID: String
    var major: String
    @MainActor static var studentCount = 0
    weak var advisor: Professor?
    
    var formattedID: String {
        return "ID: \(studentID.uppercased())"
    }
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }

    convenience init(name: String, age: Int, studentID: String) {
        self.init(name: name, age: age, studentID: studentID, major: "")
    }
}

class Professor: Person {
    var faculty: String
    @MainActor static var professorCount = 0
    var fullTitle: String {
         return "Full title: \(faculty)"
     }

    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
}

struct University {
    var name: String
    var location: String
    
    var description: String {
          return "\(name) \(location)"
      }
}



//let person = Person(name: "Suren", failableAge: 17)
//if person != nil {
//    print("\(person?.name)")
//} else {
//    print("GG")
//}
