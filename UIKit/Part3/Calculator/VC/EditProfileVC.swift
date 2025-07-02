//
//  EditProfileVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class EditProfileViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Editing profile screen"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        logLifecycle("EditProfileViewController", #function)
        title = "Edit profile"
        view.backgroundColor = .white
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logLifecycle("EditProfileViewController", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logLifecycle("EditProfileViewController", #function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logLifecycle("EditProfileViewController", #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logLifecycle("EditProfileViewController", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logLifecycle("EditProfileViewController", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logLifecycle("EditProfileViewController", #function)
    }

    private func setupView() {
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
