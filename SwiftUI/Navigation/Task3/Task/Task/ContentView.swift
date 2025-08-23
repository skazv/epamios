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
        HStack(spacing: 50) {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
