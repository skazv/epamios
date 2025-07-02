//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    private let view1 = UIView()
    private let view2 = UIView()
    
    private var verticalConstraints: [NSLayoutConstraint] = []
    private var horizontalConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        registerForTraitChanges()
        updateLayoutForTraits()
    }
    
    private func setupViews() {
        view1.backgroundColor = .systemRed
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        view2.backgroundColor = .systemBlue
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        verticalConstraints = [
            view1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 16),
            view2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view1.widthAnchor.constraint(equalToConstant: 200),
            view2.widthAnchor.constraint(equalToConstant: 200),
            view1.heightAnchor.constraint(equalToConstant: 100),
            view2.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        horizontalConstraints = [
            view1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            view2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 16),
            view1.widthAnchor.constraint(equalToConstant: 100),
            view2.widthAnchor.constraint(equalToConstant: 100),
            view1.heightAnchor.constraint(equalToConstant: 100),
            view2.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(verticalConstraints)
    }
    
    private func updateLayoutForTraits() {
            let isCompactWidth = traitCollection.horizontalSizeClass == .compact
            let isRegularHeight = traitCollection.verticalSizeClass == .regular
            let isCompactHeight = traitCollection.verticalSizeClass == .compact

            if isCompactWidth && isRegularHeight {
                NSLayoutConstraint.deactivate(horizontalConstraints)
                NSLayoutConstraint.activate(verticalConstraints)
            } else if isCompactWidth && isCompactHeight {
                NSLayoutConstraint.deactivate(verticalConstraints)
                NSLayoutConstraint.activate(horizontalConstraints)
            }
        }
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            // TODO: -  Handle the trait change.
            self.updateLayoutForTraits()
            print("Trait collection changed:", self.traitCollection)
        }
    }
}

#Preview {
    Task4ViewController()
}
