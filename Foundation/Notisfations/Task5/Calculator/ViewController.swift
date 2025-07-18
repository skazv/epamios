//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let logInButton = UIButton()
    private let contentView = UIView()
    private var bottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        setupView()
        setupGestures()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func setupGestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    
    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    private func setupView() {
        setupLabels()
        setupTextFields()
        setupButton()
    }
    
    private func setupLabels() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        bodyLabel.numberOfLines = 3
        bodyLabel.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore
        """
    }
    
    private func setupTextFields() {
        usernameField.placeholder = "Enter username"
        passwordField.placeholder = "Enter password"
        usernameField.borderStyle = .roundedRect
        passwordField.borderStyle = .roundedRect
    }
    
    private func setupButton() {
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.tintColor, for: .normal)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(usernameField)
        contentView.addSubview(passwordField)
        contentView.addSubview(logInButton)
        
        bottomConstraint = contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            contentView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            bottomConstraint!,
            
            titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            bodyLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -40),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -16),
            usernameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usernameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            passwordField.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16),
            passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = self.view.convert(keyboardFrameValue.cgRectValue, from: nil)
        print("1")
        self.bottomConstraint?.constant = -keyboardFrame.height
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func keyboardWillHide(notification:NSNotification) {
        print("2")
        self.bottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
}
