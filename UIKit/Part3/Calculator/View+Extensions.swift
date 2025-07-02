//
//  View+Extensions.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

extension UIView {
    func addsubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
