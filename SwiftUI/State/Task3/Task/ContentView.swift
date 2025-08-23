//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI

struct ChildToggleView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("change", isOn: $isOn)
            .padding()
    }
}

struct ContentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isOn ? "on" : "off")
                .font(.headline)
            ChildToggleView(isOn: $isOn)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
