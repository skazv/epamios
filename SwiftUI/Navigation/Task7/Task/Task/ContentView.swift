//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct View1: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome")
                NavigationLink("button") {
                    View2()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
    }
}

struct View2: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI Navigation!")
        }
    }
}


struct ContentView: View {
    @State private var isEnabled = true
    
    var body: some View {
        VStack(spacing: 20) {
            View1()
        }
    }
}

#Preview {
    ContentView()
}
