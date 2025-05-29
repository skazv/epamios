import Foundation

func mySuperSafeNumberOnePasswordHasher(password: String) -> String {
    var hashedPassword = "zavikiGhars" + password.reversed()
    var count = 0
    return hashedPassword.filter { c in
        count += 1
        if count.isMultiple(of: 2) {
            return false
        }
        return true
    }
}

struct User {
    let username: String
    let email: String
    let password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = mySuperSafeNumberOnePasswordHasher(password: password)
    }
}

class UserManager {
    var users: [String: User]
    var userCount: Int {
        return users.count
    }
    
    init(users: [String : User]) {
        self.users = users
    }
    
    func registerUser(username: String, email: String, password: String) -> Bool {
        if users[username] == nil {
            let user = User(username: username, email: email, password: password)
            users[username] = user
            return true
        }
        return false
    }

    func login(username: String, password: String) -> Bool {
        if let user = users[username] {
            return user.password == mySuperSafeNumberOnePasswordHasher(password: password)
        }
        return false
    }

    func removeUser(username: String) -> Bool {
        if users.removeValue(forKey: username) != nil {
            return true
        }
        return false
    }
}

class AdminUser: UserManager {
    func listAllUsers() -> [String] {
        return Array(users.keys)
    }

    deinit {
        print("dealloc")
    }
}

//var user = User(username: "123", email: "123", password: "hello")
//var userManager = UserManager(users: ["123" : user])
//print(userManager.login(username: "123", password: "hello"))
//print(mySuperSafeNumberOnePasswordHasher(password: "hello wrold"))
//print(mySuperSafeNumberOnePasswordHasher(password: "123456789"))
