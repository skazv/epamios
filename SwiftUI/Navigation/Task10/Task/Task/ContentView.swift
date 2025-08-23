//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

enum AppScreen: Hashable {
    case home
    case settings
    case profile
}

struct SettingsView: View {
    var body: some View {
        Text("cant go back lol")
    }
}

struct ContentView: View {
    @State private var isEnabled = true
    @State private var path: [AppScreen] = []
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
            }
            .padding()
            .navigationTitle("My App")
            .toolbarBackground(Color.orange.opacity(0.7), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                NavigationLink("Settings") {
                    SettingsView()
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
