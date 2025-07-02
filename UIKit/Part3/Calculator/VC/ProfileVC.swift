//
//  ProfileVC.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit profile", for: .normal)
        button.addTarget(self, action: #selector(editProfileTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        logLifecycle("ProfileViewController", #function)
        title = "Profile"
        view.backgroundColor = .white
        setupViews()
        setupNavigationBarButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logLifecycle("ProfileViewController", #function)
        updateNameLabel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logLifecycle("ProfileViewController", #function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logLifecycle("ProfileViewController", #function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logLifecycle("ProfileViewController", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logLifecycle("ProfileViewController", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logLifecycle("ProfileViewController", #function)
    }

    private func setupViews() {
        view.addSubview(nameLabel)
        view.addSubview(editProfileButton)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),

            editProfileButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            editProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupNavigationBarButtons() {
        let pencilSlash = UIBarButtonItem(image: UIImage(systemName: "pencil.slash"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(pencilSlashTapped))
        let personFill = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(personFillTapped))

        navigationItem.rightBarButtonItems = [personFill, pencilSlash]
    }

    @objc private func pencilSlashTapped() {
        let alert = UIAlertController(title: "Edit Name",
                                      message: "Enter new name:",
                                      preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "New name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let newName = alert.textFields?.first?.text, let self = self else { return }
            if newName.trimmingCharacters(in: .whitespaces).isEmpty {
                self.nameLabel.text = "Default"
            } else {
                self.nameLabel.text = newName
            }
        }))
        present(alert, animated: true)
    }

    @objc private func personFillTapped() {
        nameLabel.text = "Anonymous"
    }

    @objc private func editProfileTapped() {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }

    private func updateNameLabel() {
        if nameLabel.text == nil || nameLabel.text!.isEmpty {
            nameLabel.text = "Default"
        }
    }
}
