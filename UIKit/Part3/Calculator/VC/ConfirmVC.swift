//
//  ConfirmVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class ConfirmDetailsViewController: UIViewController {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var preferenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var startOverButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start over", for: .normal)
        button.addTarget(self, action: #selector(startOverTapped), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    private lazy var editPrefsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit preferences", for: .normal)
        button.addTarget(self, action: #selector(editPrefsTapped), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    private lazy var editPersonalInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit personal info", for: .normal)
        button.addTarget(self, action: #selector(editPersonalInfoTapped), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm", for: .normal)
        button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm Details"
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }

    private func setupViews() {
        view.addsubviews([
            nameLabel,
            phoneLabel,
            preferenceLabel,
            startOverButton,
            editPrefsButton,
            editPersonalInfoButton,
            confirmButton,
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            preferenceLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 12),
            preferenceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            preferenceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            startOverButton.topAnchor.constraint(equalTo: preferenceLabel.bottomAnchor, constant: 40),
            startOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            editPrefsButton.topAnchor.constraint(equalTo: startOverButton.bottomAnchor, constant: 16),
            editPrefsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            editPersonalInfoButton.topAnchor.constraint(equalTo: editPrefsButton.bottomAnchor, constant: 16),
            editPersonalInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            confirmButton.topAnchor.constraint(equalTo: editPersonalInfoButton.bottomAnchor, constant: 40),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    private func updateLabels() {
        nameLabel.text = "Name: \(OnboardingData.shared.name ?? "Unknown")"
        phoneLabel.text = "Phone Number: \(OnboardingData.shared.phone ?? "Unknown")"
        preferenceLabel.text = "Notification Preference: \(OnboardingData.shared.notificationPreference ?? "None")"
    }

    @objc private func startOverTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc private func editPrefsTapped() {
        if let nav = navigationController {
            for vc in nav.viewControllers {
                if vc is PreferencesViewController {
                    nav.popToViewController(vc, animated: true)
                    return
                }
            }
        }
    }

    @objc private func editPersonalInfoTapped() {
        if let nav = navigationController {
            for vc in nav.viewControllers {
                if vc is PersonalInfoViewController {
                    nav.popToViewController(vc, animated: true)
                    return
                }
            }
        }
    }

    @objc private func confirmTapped() {
        let alert = UIAlertController(title: "Success",
                                      message: "You have successfully passed onboarding.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            OnboardingData.shared.hasCompletedOnboarding = true
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }
}
