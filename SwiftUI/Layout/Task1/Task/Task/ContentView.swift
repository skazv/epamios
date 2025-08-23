//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var isShow = false
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Show Greeting", isOn: $isShow)
                .padding()
            if isShow {
                Text("Hello, SwiftUI!")
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
