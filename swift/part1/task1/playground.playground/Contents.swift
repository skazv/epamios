import UIKit

public func isPalindrome(input: String) -> Bool {
    var cleanString: String = input.lowercased().filter { c in
        c.isLetter || c.isNumber
    }
    var count: Int = cleanString.count
    if cleanString.count > 1 {
        while cleanString.count > 0 {
            if cleanString.first == cleanString.last {
                cleanString.removeFirst()
                cleanString.removeLast()
            } else {
                return false
            }
            count -= 2
            if count == 0 || count == 1 {
                return true
            }
        }
    }
    return false
}
