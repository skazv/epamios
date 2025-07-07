//
//  PreferencesVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class PreferencesViewController: UIViewController {
    private lazy var selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Notification Preference", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(selectTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var selectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = OnboardingData.shared.notificationPreference ?? "No preference selected"
        label.textAlignment = .center
        return label
    }()
    
    private let options = [
        "Email Notifications",
        "SMS Notifications",
        "Push Notifications"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Preferences"
        view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        view.addSubview(selectButton)
        view.addSubview(selectedLabel)

        NSLayoutConstraint.activate([
            selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            selectButton.heightAnchor.constraint(equalToConstant: 44),
            
            selectedLabel.topAnchor.constraint(equalTo: selectButton.bottomAnchor, constant: 12),
            selectedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    @objc private func selectTapped() {
        let actionSheet = UIAlertController(title: "Select Notification Preference", message: nil, preferredStyle: .actionSheet)
        
        for option in options {
            actionSheet.addAction(UIAlertAction(title: option, style: .default, handler: { _ in
                OnboardingData.shared.notificationPreference = option
                self.selectedLabel.text = option
                let confirmVC = ConfirmDetailsViewController()
                self.navigationController?.pushViewController(confirmVC, animated: true)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }
}
