//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct User {
    let name: String
    let age: Int
    let location: String
    let isPremium: Bool
}

struct ProfView: View {
    let user: User
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("\(user.name)")
                        Text("\(user.age)")
                    }
                    Text("\(user.location)")
                }
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(12)
            .shadow(radius: 4)
            if user.isPremium {
                Text("Premium")
                    .background(Color.yellow)
                    .offset(x: 15, y: -15)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProfView(user: User(name: "Suren", age: 33, location: "Yerevan", isPremium: true))
            ProfView(user: User(name: "KAta", age: 28, location: "London", isPremium: false))
        }
    }
}

#Preview {
    ContentView()
}
