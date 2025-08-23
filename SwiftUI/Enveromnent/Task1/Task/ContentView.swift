//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct ContentView: View {
    @StateObject private var counter = Counter()
    
    var body: some View {
        VStack(spacing: 20) {
            ShowView()
            HStack(spacing: 20) {
                PlusView()
                MinusView()
            }
        }
        .padding()
        .environmentObject(counter)
    }
}

struct ShowView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Text("\(counter.value)")
    }
}

struct PlusView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button("+1") {
            counter.value += 1
        }
    }
}

struct MinusView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        Button("-1") {
            counter.value -= 1
        }
    }
}

#Preview {
    ContentView()
}
