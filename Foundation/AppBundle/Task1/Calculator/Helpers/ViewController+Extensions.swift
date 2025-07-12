//
//  ViewController+Extensions.swift
//  Calculator
//
//  Created by Suren Kazaryan on 12.07.25.
//

import UIKit

extension UIViewController {
    func showAlarm(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
