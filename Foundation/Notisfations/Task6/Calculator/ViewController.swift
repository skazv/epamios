//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(goBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(comeBack), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func goBackground() {
        print("1")
    }
    
    @objc private func comeBack() {
        print("2")
    }
}
