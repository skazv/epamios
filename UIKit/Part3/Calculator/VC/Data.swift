//
//  Data.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

class OnboardingData {
    static let shared = OnboardingData()
    var name: String?
    var phone: String?
    var notificationPreference: String?
    var hasCompletedOnboarding = false
}
