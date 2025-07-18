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
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        navigationItem.rightBarButtonItem = logout
        
        let button = UIButton()
        button.setTitle("Theme", for: .normal)
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
        
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(
            .init(title: "light", style: .default) { _ in
                UserDefaultsManager.setTheme(theme: .light)
                self.view.window?.overrideUserInterfaceStyle = .light
            }
        )

        alert.addAction(
            .init(title: "dark", style: .default) { _ in
                UserDefaultsManager.setTheme(theme: .dark)
                self.view.window?.overrideUserInterfaceStyle = .dark
            }
        )
        
        alert.addAction(
            .init(title: "system", style: .default) { _ in
                UserDefaultsManager.setTheme(theme: .system)
                self.view.window?.overrideUserInterfaceStyle = .unspecified
            }
        )

        alert.addAction(.init(title: "cancel", style: .cancel))

        present(alert, animated: true)
    }

    @objc private func logoutTapped() {
        UserDefaultsManager.logout()
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}
