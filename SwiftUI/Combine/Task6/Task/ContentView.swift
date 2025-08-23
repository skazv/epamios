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
    @State private var displayedText = ""
    @State var hello: [Int] = []
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
                .flatMap { value in
                    Just(value * value)
                }
                .sink { square in
                    hello.append(square)
                    print("\(square)")
                }
            let nums = [1, 2, 3, 4]
            nums.forEach { sabject.send($0) }
        }
    }
}

#Preview {
    ContentView()
}
