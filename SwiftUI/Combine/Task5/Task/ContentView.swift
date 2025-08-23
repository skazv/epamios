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
    private let sabject = PassthroughSubject<String, Never>()
    @State private var displayedText = ""
    let hello = ["H", "He", "Hel", "Hell", "Hello"]
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(displayedText)
        }
        .padding()
        .onAppear() {
            cancellable = sabject
                .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
                .sink { value in
                    displayedText = value
                }
            for (index, text) in hello.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.5) {
                    self.sabject.send(text)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
