//
//  TabBarController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//


import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupTabBarAppearance()
    }

    private func setupTabs() {
        let onboardingVC = OnboardingViewController()
        let onboardingNav = UINavigationController(rootViewController: onboardingVC)
        onboardingNav.tabBarItem = UITabBarItem(title: "Onboarding",
                                                image: UIImage(systemName: "book"),
                                                selectedImage: UIImage(systemName: "star.fill"))
        let profileVC = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile",
                                             image: UIImage(systemName: "person"),
                                             selectedImage: UIImage(systemName: "person.fill"))
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings",
                                             image: UIImage(systemName: "gearshape"),
                                             selectedImage: UIImage(systemName: "gearshape.fill"))
        viewControllers = [onboardingNav, profileNav, settingsVC]
    }

    private func setupTabBarAppearance() {
        tabBar.backgroundColor = .orange
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
}

func logLifecycle(_ className: String, _ methodName: String) {
    print("\(className) - \(methodName)")
}
