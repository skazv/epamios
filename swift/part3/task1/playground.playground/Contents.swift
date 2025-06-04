import Foundation

protocol Borrowable {
    var borrowDate: Date? { get set }
    var returnDate: Date? { get set }
    var isBorrowed: Bool { get set }

    mutating func checkIn()
}

extension Borrowable {
    func isOverdue() -> Bool {
        if let returnDate = returnDate {
            if Date() > returnDate {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    mutating func checkIn() {
        borrowDate = nil
        returnDate = nil
        isBorrowed = false
    }
}

class Item {
    let id: String
    let title: String
    let author: String

    init(id: String, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}

class Book: Item, Borrowable {
    var borrowDate: Date?
    var returnDate: Date?
    var isBorrowed: Bool = false
}

enum LibraryError: Error {
    case itemNotFound
    case itemNotBorrowable
    case alreadyBorrowed
}

class Library {
    private var items: [String: Item] = [:]

    func addItem(_ item: Item) {
        items[item.id] = item
    }
    
    func borrowItem(id: String, forDays days: Int) throws {
        if let item = items[id] {
            if var borrowableItem = item as? Borrowable {
                if borrowableItem.isBorrowed {
                    throw LibraryError.alreadyBorrowed
                }
                
                let now = Date()
                borrowableItem.borrowDate = now
                borrowableItem.returnDate = Calendar.current.date(byAdding: .day, value: days, to: now)
                borrowableItem.isBorrowed = true
                
                if let book = item as? Book {
                    book.borrowDate = borrowableItem.borrowDate
                    book.returnDate = borrowableItem.returnDate
                    book.isBorrowed = true
                }
            } else {
                throw LibraryError.itemNotBorrowable
            }
        } else {
            throw LibraryError.itemNotFound
        }
    }

    func checkInItem(id: String) {
        if var borrowableItem = items[id] as? Borrowable {
            borrowableItem.checkIn()

            if var book = items[id] as? Book {
                book.borrowDate = borrowableItem.borrowDate
                book.returnDate = borrowableItem.returnDate
                book.isBorrowed = borrowableItem.isBorrowed
                items[id] = book
            }
        }
    }

    func isItemOverdue(id: String) -> Bool? {
        return (items[id] as? Borrowable)?.isOverdue()
    }
}
