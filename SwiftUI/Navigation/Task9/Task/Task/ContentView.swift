//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

enum AppScreen: Hashable {
    case home
    case settings
    case profile
}

struct DetailView: View {
    let fruit: String
    @State private var showModal = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Detail \(fruit)")
                .font(.largeTitle)
            
            Button("dop info") {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                ModalView(fruit: fruit)
            }
        }
        .padding()
    }
}

struct ModalView: View {
    let fruit: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(fruit)")
                .font(.title)
            Text("good \(fruit)")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct ContentView: View {
    @State private var isEnabled = true
    @State private var path: [AppScreen] = []
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { fruit in
                NavigationLink(fruit) {
                    DetailView(fruit: fruit)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
