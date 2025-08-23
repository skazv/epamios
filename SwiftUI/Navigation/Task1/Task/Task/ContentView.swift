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
            Text("SwiftUI Layout Modifiers")
                .padding(16)
                .background(Color.red.opacity(0.5))
            Text("top bot")
                .padding([.top, .bottom], 16)
                .background(Color.blue.opacity(0.5))
            Text("right bot")
                .padding([.trailing, .bottom], 16)
                .background(Color.orange.opacity(0.5))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
