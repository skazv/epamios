import Foundation

let books = [
["title": "Swift Fundamentals", "author": "John Doe", "year": 2015, "price": 40, "genre": ["Programming", "Education"]],
["title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925, "price": 15, "genre": ["Classic", "Drama"]],
["title": "Game of Thrones", "author": "George R. R. Martin", "year": 1996, "price": 30, "genre": ["Fantasy", "Epic"]],
["title": "Big Data, Big Dupe", "author": "Stephen Few", "year": 2018, "price": 25, "genre": ["Technology", "Non-Fiction"]],
["title": "To Kill a Mockingbird", "author": "Harper Lee", "year": 1960, "price": 20, "genre": ["Classic", "Drama"]]
]

let discountedPrices: Array<Double> = books.map { book in
    let price: Int = book["price"] as? Int ?? 0
    return Double(price) * 0.9
}

let booksPostedAfter2000: Array<String> = books.filter { book in
    if book["year"] as? Int ?? 0 > 2000 {
        return true
    } else {
        return false
    }
}.map { book in
    return book["title"] as? String ?? ""
}

let allGenres: Set<String> = Set(books.flatMap { book in
    book["genre"] as? [String] ?? []
})

let totalCost: Int = books.reduce(0) { sum, book in
    sum + (book["price"] as? Int ?? 0)
}

print(discountedPrices)
print(booksPostedAfter2000)
print(allGenres)
print(totalCost)
