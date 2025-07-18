//
//  LoginViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 18.07.25.
//


import UIKit

class LoginViewController: UIViewController {
    private let emailField = UITextField()
    private let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        emailField.placeholder = "email"
        emailField.borderStyle = .roundedRect

        loginButton.setTitle("login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [emailField, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }

    @objc private func loginTapped() {
        if let email = emailField.text, !email.isEmpty {
            UserDefaultsManager.setLogin(email: email)
            switchToMain()
        }
    }

    private func switchToMain() {
        let mainVC = ViewController()
        let nav = UINavigationController(rootViewController: mainVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
