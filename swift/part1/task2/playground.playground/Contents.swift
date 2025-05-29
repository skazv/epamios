import UIKit

public func isBalancedParentheses(input: String) -> Bool {
    var count: Int = 0
    var onlyBrace: String = input.filter { character in
        character == "(" || character == ")"
    }
    for c in onlyBrace {
        if c == "(" {
            count += 1;
        } else if c == ")" {
            count -= 1
        }
        if count < 0 {
            return false
        }
    }
    if count == 0 {
        return true
    }
    return false
}
