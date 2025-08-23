//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var cancellable: AnyCancellable?
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            let publisher = Just("Hello, Combine!")
            cancellable = publisher.sink { value in
                print(value)
            }
        }
    }
}

#Preview {
    ContentView()
}
