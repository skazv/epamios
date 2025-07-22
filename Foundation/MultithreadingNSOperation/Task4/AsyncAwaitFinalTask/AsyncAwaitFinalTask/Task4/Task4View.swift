//
//  Task4View.swift
//  AsyncAwaitFinalTask
//
//  Created by Nikolay Dechko on 08/07/2024.
//
import SwiftUI

struct Task4View: View {
    @State var api = Task4ViewAPI()
    @State var finished: Bool = false
    @State var ballance: Int = 1000
    
    var body: some View {
        VStack {
            Text("Starting ballance: 1000")
            if finished {
                Text("Final balance: \(ballance)")
                Text(ballance == 0 ? "Success" : "Failure")
            }
            Button {
                if finished {
                    api = Task4ViewAPI()
                    ballance = 1000
                    finished = false
                } else {
                    Task {
                        ballance = await api.startUpdate()
                        self.finished = true
                    }
                }
            } label: {
                if finished {
                    Text("Reset")
                } else {
                    Text("Start")
                }
            }
        }
    }
}

#Preview {
    Task4View()
}

actor BalancActor {
    var value = 1000
    
    func minusOne() {
        value -= 1
    }
}

class Task4ViewAPI: @unchecked Sendable {
    let actor = BalancActor()
    var ballance: Int = 1000
    let lock: NSLock = NSLock()
    
    func startUpdate() async -> Int {
        await withTaskGroup(of: Void.self) { group in
            for _ in 0...999 {
                group.addTask { [weak self] in
                    await self?.actor.minusOne()
                }
            }
        }
        
        return await actor.value
    }
}
