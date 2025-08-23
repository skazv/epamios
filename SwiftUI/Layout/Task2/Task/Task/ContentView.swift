//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    let names = ["a", "b", "c", "d", "e"]
    
    var body: some View {
        List(names, id: \.self) { name in
            HStack {
                Text(name)
                Spacer()
                Button("Tap") {
                    print("\(name)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
