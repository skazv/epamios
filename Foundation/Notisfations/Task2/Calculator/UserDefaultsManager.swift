//
//  UserDefaultsManager.swift
//  Calculator
//
//  Created by Suren Kazaryan on 17.07.25.
//

import Foundation

struct UserDefaultsManager {
    private init() {}
    public static let shared = UserDefaultsManager()
    
    static func setTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: UserDefaultsKeys.theme.rawValue)
    }
    
    static func getTheme() -> Theme {
        var theme = ""
        theme = UserDefaults.standard.string(forKey: UserDefaultsKeys.theme.rawValue) ?? ""
        if let theme = Theme(rawValue: theme) {
            return theme
        } else {
            return .system
        }
    }
    
    static func setLogin(email: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultsKeys.email.rawValue)
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.login.rawValue)
    }

    static func getLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultsKeys.login.rawValue)
    }

    static func logout() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.email.rawValue)
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.login.rawValue)
    }

    static func getEmail() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.email.rawValue)
    }
}
