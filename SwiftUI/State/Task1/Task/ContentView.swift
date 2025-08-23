//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title)
            Button("+1") {
                count += 1
            }
        }
        .padding()
        .onAppear() {

        }
    }
}

#Preview {
    ContentView()
}
