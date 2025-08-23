//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Observation

@Observable
class CounterModel {
    var count = 0
}

struct View2: View {
    var counter: CounterModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(counter.count)")
            Button("+1") {
                counter.count += 1
            }
        }
    }
}

struct ContentView: View {
    @State private var counter = CounterModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("\(counter.count)")
                Button("+1") {
                    counter.count += 1
                }
                NavigationLink("view2") {
                    View2(counter: counter)
                }
                .padding()
            }
            .padding()
            .navigationTitle("view1")
        }
    }
}

#Preview {
    ContentView()
}
