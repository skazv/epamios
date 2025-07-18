import Foundation

let ds = DispatchSemaphore(value: 2)

func performTask(id: Int) {
    ds.wait()
    print("Task \(id) started")
    sleep(1) // Simulate a task taking time
    print("Task \(id) finished")
    ds.signal()
}

func runConcurrentTasks() {
    let threads = (1...5).map { id in
        Thread {
            performTask(id: id)
        }
    }

    threads.forEach { $0.start() }
}

runConcurrentTasks()
