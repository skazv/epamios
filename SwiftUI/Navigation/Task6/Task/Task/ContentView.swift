//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

extension View {
    func newStylebuttom(isEnabled: Bool) -> some View {
        self
            .background(isEnabled ? Color.red : Color.yellow)
            .foregroundColor(isEnabled ? Color.white : Color.black)
    }
}

struct ContentView: View {
    @State private var isEnabled = true
    
    var body: some View {
        VStack(spacing: 20) {
            Button("button") {
                isEnabled.toggle()
            }
            .newStylebuttom(isEnabled: isEnabled)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
