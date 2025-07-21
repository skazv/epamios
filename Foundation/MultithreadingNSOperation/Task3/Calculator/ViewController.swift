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
        
        let b = BlockOperation {
            print("b start \(Thread.current)")
            for _ in 0..<1000000 { }
            print("b finish")
        }
        
        let a = BlockOperation {
            print("a start \(Thread.current)")
            b.cancel()
            for _ in 0..<1000000 { }
            print("a finish")
        }
        
        b.addDependency(a)
        oq.addOperations([a, b], waitUntilFinished: false)
    }
    
}
