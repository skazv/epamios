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
    private let sabject = PassthroughSubject<Int, Never>()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            cancellable = sabject
                .filter { $0 % 2 == 0 }
                .sink { value in
                    print("\(value)")
                }
            sabject.send(1)
            sabject.send(2)
            sabject.send(3)
            sabject.send(4)
        }
    }
}

#Preview {
    ContentView()
}
