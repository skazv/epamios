import Foundation

class Stack<T> {
    private var elements: [T] = []

    func push(_ element: T) {
        elements.append(element)
    }

    func pop() -> T? {
        return elements.popLast()
    }

    func size() -> Int {
        return elements.count
    }

    func printStackContents() -> String {
        var elementsString: String = ""
        for element in elements {
            print(element)
            elementsString += "\(element)"
        }
        return elementsString
    }
}

//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//print(stack.printStackContents())
