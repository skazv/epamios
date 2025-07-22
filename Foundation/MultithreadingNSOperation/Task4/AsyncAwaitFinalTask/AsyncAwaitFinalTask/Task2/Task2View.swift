//
//  Task2View.swift
//  AsyncAwaitFinalTask
//
//  Created by Nikolay Dechko on 4/9/24.
//

import SwiftUI

struct Task2View: View {
    let task2API: Task2API = .init()
    
    @State var user: Task2API.User?
    @State var products: [Task2API.Product] = []
    @State var duration: TimeInterval?
    
    var body: some View {
        VStack {
            if let user, !products.isEmpty, let duration {
                Text("User name: \(user.name)").padding()
                List(products) { product in
                    Text("product description: \(product.description)")
                }
                Text("it took: \(duration) second(s)")
            } else {
                Text("Loading in progress")
            }
        }.task {
            let startDate = Date.now
            do {
                try await withThrowingTaskGroup(of: Any.self) { group in
                    group.addTask {
                        return try await task2API.getUser()
                    }
                    group.addTask {
                        return try await task2API.getProducts()
                    }
                    for try await result in group {
                        if let user = result as? Task2API.User {
                            self.user = user
                        } else if let product = result as? [Task2API.Product] {
                            self.products = product
                        }
                        else {
                            print(result)
                        }
                    }
                }
            }
            catch {
                print(error)
            }
            let endDate = Date.now
            duration = DateInterval(start: startDate, end: endDate).duration
        }
    }
    
}

class Task2API: @unchecked Sendable {
    struct User {
        let name: String
    }
    
    struct Product: Identifiable {
        let id: String
        let description: String
    }
    
    func getUser() async throws -> User {
        try await Task.sleep(for: .seconds(1))
        return .init(name: "John Smith")
    }
    
    func getProducts() async throws -> [Product] {
        try await Task.sleep(for: .seconds(1))
        return [.init(id: "1", description: "Some cool product"),
                .init(id: "2", description: "Some expensive product")]
    }
}

#Preview {
    Task2View()
}
