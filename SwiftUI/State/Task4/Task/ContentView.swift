//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Observation

@Observable
class UserProfile {
    var name: String = "Suren"
    var email: String = "suren@suren.com"
}

struct ContentView: View {
    @State private var profile = UserProfile()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("name", text: $profile.name)
            TextField("email", text: $profile.email)
            VStack {
                Text("\(profile.name)")
                Text("\(profile.email)")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
