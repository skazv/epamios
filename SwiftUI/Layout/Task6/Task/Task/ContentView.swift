//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Combine

struct Item: Identifiable {
    let id = UUID()
    let name: String
    var isOn: Bool
}

struct ContentView: View {
    @State private var items = [
        Item(name: "a", isOn: false),
        Item(name: "b", isOn: false),
        Item(name: "v", isOn: false)
    ]
    
    var body: some View {
        List($items) { $item in
            Toggle(item.name, isOn: $item.isOn)
        }
    }
}

#Preview {
    ContentView()
}
