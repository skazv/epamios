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
    
    static func saveSearchTerm(_ term: String) {
        var current: [String] = getSearchHistory()
        current.insert(term, at: 0)
        
        if current.count > 5 {
            current.removeLast()
        }
        
        UserDefaults.standard.set(current, forKey: UserDefaultsKeys.searches.rawValue)
    }
    
    static func getSearchHistory() -> [String] {
        return UserDefaults.standard.stringArray(forKey: UserDefaultsKeys.searches.rawValue) ?? []
    }
}
