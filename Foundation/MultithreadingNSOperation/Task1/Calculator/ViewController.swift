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
        let bo = BlockOperation {
            print("Operation \"A\" started")
            for _ in 0..<1000000 {
               // do nothing
            }
            print("Operation \"A\" finished")
          }
//        OperationQueue.main.addOperation(bo)
        let oq = OperationQueue()
        oq.addOperation(bo)
    }
    
}
