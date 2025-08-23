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
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(x: -160, y: -410)
            Rectangle()
                .fill(Color.green)
                .frame(width: 200, height: 150)
                .offset(x: -30, y: -310)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
