//
//  View.swift
//  Calculator
//
//  Created by Suren Kazaryan on 12.07.25.
//

import UIKit

class MainView: UIView {
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .systemBackground
        textField.textAlignment = .center
        textField.layer.borderWidth = 1
        textField.textColor = .lightGray
        textField.placeholder = "File name..."
        textField.font = .systemFont(ofSize: 30)
        return textField
    }()
    
    private lazy var textTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 20
        textView.backgroundColor = .systemBackground
        textView.textAlignment = .center
        textView.layer.borderWidth = 1
        textView.isEditable = true
        textView.textColor = .lightGray
        textView.font = .systemFont(ofSize: 25)
        return textView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .systemOrange
        return button
    }()
    
    lazy var loadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemOrange
        return button
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loaded text"
        label.numberOfLines = 10
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.backgroundColor = .secondarySystemBackground
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.isUserInteractionEnabled = true
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func giveName() -> String {
        return nameTextField.text ?? ""
    }
    
    func giveText() -> String {
        return textTextView.text ?? ""
    }
    
    func loadText(text: String) {
        textLabel.text = text
    }
}

// MARK: - private methods
extension MainView {
    private func setup() {
        backgroundColor = .white
        
        addSubviews(views: [
            nameTextField,
            textTextView,
            saveButton,
            loadButton,
            textLabel,
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            textTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            textTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            
            loadButton.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 15),
            loadButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            loadButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -8),
            loadButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            saveButton.topAnchor.constraint(equalTo: textTextView.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 8),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            saveButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            textLabel.topAnchor.constraint(equalTo: loadButton.bottomAnchor, constant: 15),
            textLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }
    
}
