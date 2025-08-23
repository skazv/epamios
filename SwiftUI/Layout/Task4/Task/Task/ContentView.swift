//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var isDark = false
    var body: some View {
        ZStack {
            (isDark ? Color.black : Color.white).ignoresSafeArea()
            Toggle(isOn: $isDark) {
            }
            .toggleStyle(SwitchToggleStyle(tint: isDark ? .purple : .blue))
        }
        .animation(.easeInOut, value: isDark)
    }
}

#Preview {
    ContentView()
}
