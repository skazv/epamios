//
//  Scene+Extension.swift
//  Calculator
//
//  Created by Suren Kazaryan on 17.07.25.
//

extension SceneDelegate {
    
    func overrideApplicationThemeStyle() {
        let theme = UserDefaultsManager.getTheme()
        switch theme {
        case .dark:
            window?.overrideUserInterfaceStyle = .dark
            break
        case .light:
            window?.overrideUserInterfaceStyle = .light
            break
        default:
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
}
