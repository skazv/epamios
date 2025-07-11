//
//  View+Extensions.swift
//  Calculator
//
//  Created by Suren Kazaryan on 11.07.25.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
