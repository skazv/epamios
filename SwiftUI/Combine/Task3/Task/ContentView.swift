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
            let namePublisher = Just("ыгкут")
                .map { $0.uppercased() }
            let surnamePublisher = Just("лфяфкнфт")
            cancellable = Publishers.CombineLatest(namePublisher, surnamePublisher)
                .map { name, surname in
                    return "\(name) \(surname)"
                }
                .sink { combinedValue in
                    print(combinedValue)
                }
        }
    }
}

#Preview {
    ContentView()
}
