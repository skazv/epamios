//
//  ContentView.swift
//  Task
//
//  Created by Suren Kazaryan on 23.08.25.
//

import SwiftUI

class TaskManager: ObservableObject {
    @Published var tasks: [String] = []
}

struct ContentView: View {
    @StateObject private var taskManager = TaskManager()
    @State private var task = ""
    @State private var removeIndexx = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Tasks:")
                ForEach(Array(taskManager.tasks.enumerated()), id: \.offset) { index, task in
                    Text("\(index + 1). \(task)")
                }
            }
            HStack {
                TextField("task", text: $task)
                Button("add") {
                    guard !task.isEmpty else { return }
                    taskManager.tasks.append(task)
                    task = ""
                }
            }
            
            HStack {
                TextField("index", text: $removeIndexx)
                    .keyboardType(.numberPad)
                Button("remove") {
                    if let index = Int(removeIndexx),
                       index > 0, index <= taskManager.tasks.count {
                        taskManager.tasks.remove(at: index - 1)
                        removeIndexx = ""
                    }
                }
            }
        }
        .padding()
        .environmentObject(taskManager)
    }
}
#Preview {
    ContentView()
}
