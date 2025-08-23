//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("", isOn: $isOn)
                .padding()
            if isOn {
                Text("Hello, SwiftUI!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
