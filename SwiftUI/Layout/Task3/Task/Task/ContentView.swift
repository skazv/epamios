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
        HStack() {
            Circle()
                .fill(Color.gray)
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text("Suren Kazaryan")
                    .font(.title)
                Text("iOS developer")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ContentView()
}
