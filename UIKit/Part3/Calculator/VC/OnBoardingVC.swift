//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class OnboardingViewController: UIViewController {
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(OnboardingData.shared.hasCompletedOnboarding ? "Restart" : "Start", for: .normal)
        button.setTitleColor(OnboardingData.shared.hasCompletedOnboarding ? .systemGreen : .systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 80)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OnBoarding"
        view.backgroundColor = .white
        setupLayput()
    }

    private func setupLayput() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 100),
            startButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var title = "Start"
        var color: UIColor = .systemBlue
        if OnboardingData.shared.hasCompletedOnboarding {
            title = "Restart"
        }
        if OnboardingData.shared.hasCompletedOnboarding {
            color = .systemGreen
        }
        startButton.setTitle(title, for: .normal)
        startButton.setTitleColor(color, for: .normal)
    }

    @objc private func startTapped() {
        if OnboardingData.shared.hasCompletedOnboarding {
            OnboardingData.shared.name = nil
            OnboardingData.shared.phone = nil
            OnboardingData.shared.notificationPreference = nil
            OnboardingData.shared.hasCompletedOnboarding = false
        }
        let personalInfoVC = PersonalInfoViewController()
        navigationController?.pushViewController(personalInfoVC, animated: true)
    }
}
