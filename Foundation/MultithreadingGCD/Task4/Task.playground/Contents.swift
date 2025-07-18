import Foundation

func executeTask(_ taskNumber: Int, delay: UInt32) {
    print("Task \(taskNumber) started")
    sleep(delay) // Simulate work
    print("Task \(taskNumber) finished")
}

func executeTasks() {
    let queue1 = DispatchQueue(label: "com.example.queue1", attributes: .concurrent)
    let queue2 = DispatchQueue(label: "com.example.queue2", attributes: .concurrent)
    let queueFinal = DispatchQueue(label: "com.example.finalQueue")
    let g = DispatchGroup()
    
    g.enter()
    queue1.async {
        executeTask(1, delay: 2)
        g.leave()
    }
    
    g.enter()
    queue2.async {
        executeTask(2, delay: 3)
        g.leave()
    }
    
    g.notify(queue: .main) {
        queueFinal.async {
            executeTask(3, delay: 1)
        }
    }
}

// Run the function
executeTasks()
