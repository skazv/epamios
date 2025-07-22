//
//  Task3View.swift
//  AsyncAwaitFinalTask
//
//  Created by Nikolay Dechko on 05/07/2024.
//

import SwiftUI

struct Task3View: View {
    @State var currentStrength: Task3API.SignalStrenght = .unknown
    @State var running: Bool = false
    
    let api = Task3API()
    
    var body: some View {
        VStack {
            HStack {
                Text("Current signal strength: \(currentStrength)")
            }
            Button {
                if running {
                    running.toggle()
                    api.cancel()
                } else {
                    running.toggle()
                    Task {
                        let stream = api.signalStrength()
                        for await strength in stream {
                            currentStrength = strength
                        }
                        currentStrength = .unknown
                        print("stream finished")
                    }
                }
            } label: {
                if running {
                    Text("Cancel")
                } else {
                    Text("Start monitoring")
                }
            }
            
        }
    }
}

class Task3API {
    private var asContin: AsyncStream<SignalStrenght>.Continuation?
    private var task: Task<Void, Never>?
    
    enum SignalStrenght: String {
        case weak, strong, excellent, unknown
    }
    
    func signalStrength() -> AsyncStream<SignalStrenght> {
        return AsyncStream { continuation in
            self.task = Task {
                while (!Task.isCancelled) {
                    try? await Task.sleep(for: .seconds(1))
                    continuation.yield(with: .success([SignalStrenght.weak, .strong, .excellent].randomElement() ?? .unknown))
                }
                continuation.finish()
            }
        }
    }
    
    func cancel() {
        task?.cancel()
        asContin?.finish()
    }
}

#Preview {
    Task3View()
}
