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
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 150, height: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 150, height: 100)
        }
    }
}

#Preview {
    ContentView()
}
