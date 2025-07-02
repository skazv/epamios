//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    private var isTaggedPostsVisible = false
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: ._1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Suren Kazaryan"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No skill just luck\nArmenian iOS Developer without money"
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private lazy var taggedPostsSection: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please work"
        label.backgroundColor = UIColor.systemGray6
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.isHidden = true
        return label
    }()

    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tagged Posts", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(toggleTagged), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }

}

// MARK: - Private methodss
extension ViewController {
    
    private func setupLayout() {
        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),

            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            taggedPostsSection.heightAnchor.constraint(equalToConstant: 50)
        ])

        setupProfileHeader()
        mainStackView.addArrangedSubview(bioLabel)
        mainStackView.addArrangedSubview(followButton)
        mainStackView.addArrangedSubview(taggedPostsSection)
        mainStackView.addArrangedSubview(toggleButton)
    }

    private func setupProfileHeader() {
        let profileStack = UIStackView()
        profileStack.axis = .horizontal
        profileStack.spacing = 12
        profileStack.alignment = .center
        
        let nameAndStatsStack = UIStackView()
        nameAndStatsStack.axis = .vertical
        nameAndStatsStack.spacing = 12
        nameAndStatsStack.addArrangedSubview(nameLabel)
        
        let statsStack = UIStackView()
        statsStack.axis = .horizontal
        statsStack.alignment = .center
        statsStack.distribution = .equalSpacing
        statsStack.addArrangedSubview(makeStackView(number: "28", label: "Posts"))
        statsStack.addArrangedSubview(makeStackView(number: "89.000", label: "Followers"))
        statsStack.addArrangedSubview(makeStackView(number: "800", label: "Following"))
        nameAndStatsStack.addArrangedSubview(statsStack)
        profileStack.addArrangedSubview(profileImageView)
        profileStack.addArrangedSubview(nameAndStatsStack)
        mainStackView.addArrangedSubview(profileStack)
    }

    private func makeStackView(number: String, label: String) -> UIStackView {
        let countLabel = UILabel()
        countLabel.text = number
        countLabel.font = .boldSystemFont(ofSize: 16)
        countLabel.textAlignment = .center
        
        let nameLabel = UILabel()
        nameLabel.text = label
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [countLabel, nameLabel])
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }

    private func setupStatsSection() {
        let statsStack = UIStackView()
        statsStack.axis = .horizontal
        statsStack.alignment = .center
        statsStack.distribution = .equalSpacing
        
        let posts = makeStackView(number: "28", label: "Posts")
        let followers = makeStackView(number: "89.000", label: "Followers")
        let following = makeStackView(number: "800", label: "Following")
        
        statsStack.addArrangedSubview(posts)
        statsStack.addArrangedSubview(followers)
        statsStack.addArrangedSubview(following)
        mainStackView.addArrangedSubview(statsStack)
    }

    @objc private func toggleTagged() {
        isTaggedPostsVisible.toggle()
        UIView.animate(withDuration: 0.5) {
            self.taggedPostsSection.isHidden = !self.isTaggedPostsVisible
            self.view.layoutIfNeeded()
        }
    }
}
