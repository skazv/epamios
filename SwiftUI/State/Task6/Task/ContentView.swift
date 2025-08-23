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

struct SettingItem: Identifiable {
    let id = UUID()
    let name: String
    var isOn: Bool
}

struct ContentView: View {
    @State private var formModel = FormModel()
    @State private var settings: [SettingItem] = [
        SettingItem(name: "1", isOn: false),
        SettingItem(name: "2", isOn: false),
        SettingItem(name: "3", isOn: false),
        SettingItem(name: "4", isOn: false)
    ]
    
    var body: some View {
        List {
            ForEach(settings.indices, id: \.self) { index in
                Toggle(settings[index].name, isOn: $settings[index].isOn)
            }
        }
    }
}

#Preview {
    ContentView()
}
