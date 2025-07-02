//
//  SettingsVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class SettingsViewController: UIViewController {
    private lazy var toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Navigation is easy!"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {

        view.addSubview(label)
        view.addSubview(toggle)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),

            toggle.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
