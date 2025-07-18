//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    private let searchField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let resultsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        giveSearches()
    }
    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        searchField.borderStyle = .roundedRect
        searchButton.setTitle("search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        
        resultsLabel.numberOfLines = 0
        resultsLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [searchField, searchButton, resultsLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchField.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
    @objc private func searchTapped() {
        guard let term = searchField.text, !term.isEmpty else { return }
        UserDefaultsManager.saveSearchTerm(term)
        giveSearches()
        searchField.text = ""
    }
    
    private func giveSearches() {
        let searches = UserDefaultsManager.getSearchHistory()
        resultsLabel.text = searches.joined(separator: "\n")
    }
}
