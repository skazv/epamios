//
//  SecondVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 18.07.25.
//

import UIKit

class SecondVC: UIViewController {
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .customNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("deinit")
    }
    
    
}

// MARK: - private methods
extension SecondVC {
    private func setup() {
        label.text = "not pressed"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc private func handleNotification(_ notification: Notification) {
        if let text = notification.userInfo?["text"] as? String {
            label.text = text
        }
    }
    
}
