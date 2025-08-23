//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Text("SwiftUI is amazing!")
                .background(Color.gray)
                .overlay(
                    Circle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: 150, height: 150)
                )
                .clipShape(.rect)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
