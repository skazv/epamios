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
    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        
        let button = UIButton()
        button.setTitle("send", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(themeTapped), for: .touchUpInside)
        button.layer.cornerRadius = 25
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc private func themeTapped() {
        NotificationCenter.default.post(name: .customNotification, object: nil, userInfo: ["text": "yeahhhh"])
    }
    
}
