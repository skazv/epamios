//
//  ViewController+Eztensions.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//

import UIKit

extension UIView {
    
    func addSubviews(views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
}
