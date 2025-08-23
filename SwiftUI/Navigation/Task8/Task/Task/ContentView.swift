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

struct ContentView: View {
    @State private var isEnabled = true
    @State private var path: [AppScreen] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Text("Home View")
                    .font(.largeTitle)
                Button("Go to Settings") {
                    path.append(.settings)
                }
            }
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .home:
                    VStack(spacing: 20) {
                        Text("Home View")
                        Button("Go to Settings") {
                            path.append(.settings)
                        }
                    }
                case .settings:
                    VStack(spacing: 20) {
                        Text("Settings View")
                            .font(.largeTitle)
                        Button("Go to Profile") {
                            path.append(.profile)
                        }
                    }
                case .profile:
                    VStack(spacing: 20) {
                        Text("Profile View")
                            .font(.largeTitle)
                        Button("Go to Home") {
                            path.removeAll()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
