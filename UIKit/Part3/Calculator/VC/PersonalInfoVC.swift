//
//  PersonalInfoVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    private lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var phoneField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter phone number"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personal Info"
        view.backgroundColor = .white
        setupFields()
        setupButton()
        updateConfirmButtonState()
    }

    private func setupFields() {
        view.addSubview(nameField)
        view.addSubview(phoneField)

        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nameField.heightAnchor.constraint(equalToConstant: 44),

            phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            phoneField.heightAnchor.constraint(equalToConstant: 44)
        ])
        if let name = OnboardingData.shared.name {
            nameField.text = name
        }
        if let phone = OnboardingData.shared.phone {
            phoneField.text = phone
        }
    }

    private func setupButton() {
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(.systemBlue, for: .normal)
        confirmButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        view.addSubview(confirmButton)

        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 40),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 44),
            confirmButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }

    @objc private func textChanged() {
        updateConfirmButtonState()
    }

    private func updateConfirmButtonState() {
        let nameIsValid = !(nameField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true)
        let phoneIsValid = (phoneField.text?.count ?? 0) >= 9
        confirmButton.isEnabled = nameIsValid && phoneIsValid
        confirmButton.alpha = confirmButton.isEnabled ? 1.0 : 0.5
    }

    @objc private func confirmTapped() {
        guard let name = nameField.text, let phone = phoneField.text else { return }
        let alert = UIAlertController(title: "Confirm Information",
                                      message: "Please confirm your name and phone number.\nName: \(name)\nPhone: \(phone)",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Edit", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { _ in
            OnboardingData.shared.name = name
            OnboardingData.shared.phone = phone
            let preferencesVC = PreferencesViewController()
            self.navigationController?.pushViewController(preferencesVC, animated: true)
        }))
        present(alert, animated: true)
    }
}
