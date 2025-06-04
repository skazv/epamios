import Foundation

struct School {
    enum SchoolRole {
        case student
        case teacher
        case administrator
    }
    
    class Person {
        let name: String
        let role: SchoolRole
        
        init(name: String, role: SchoolRole) {
            self.name = name
            self.role = role
        }
    }
    
    private var people: [Person] = []
    
    subscript(role: SchoolRole) -> [Person] {
        var result: [Person] = []
        for person in people {
            if person.role == role {
                result.append(person)
            }
        }
        return result
    }
    
    mutating func addPerson(_ person: Person) {
        people.append(person)
    }
}

func countStudents(school: School) -> Int {
    let totalCount = school[.student].count
    return totalCount
}

func countTeachers(school: School) -> Int {
    let totalCount = school[.teacher].count
    return totalCount
}

func countAdministrators(school: School) -> Int {
    let totalCount = school[.administrator].count
    return totalCount
}

var school = School()

//school.addPerson(School.Person(name: "Suren", role: .student))
//print("\(countStudents(school: school))")
