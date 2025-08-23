//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI
import Observation

@Observable
class FormModel {
    var email: String = ""
}

struct ContentView: View {
    @State private var formModel = FormModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("email", text: $formModel.email)
            Button("submit") {
                print("\(formModel.email)")
            }
            .disabled(formModel.email.isEmpty)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
