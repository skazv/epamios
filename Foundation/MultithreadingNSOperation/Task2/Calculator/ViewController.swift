//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        let oq = OperationQueue()
        oq.maxConcurrentOperationCount = 2
        
        let a = BlockOperation {
            print("a start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("a finish")
        }
        
        let b = BlockOperation {
            print("b start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("b finish")
        }
        
        let c = BlockOperation {
            print("c start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("c finish")
        }
        
        let d = BlockOperation {
            print("d start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("d finish")
        }
        
        let e = BlockOperation {
            print("e start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("e finish")
        }
        
        b.addDependency(c)
        d.addDependency(b)
        //C A B E D
//        a.queuePriority = .low
        oq.addOperations([a, b, c, d, e], waitUntilFinished: false)
    }
    
}
