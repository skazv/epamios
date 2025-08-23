//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit
import SwiftUI

struct SwifuiView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("hello from swiftui!!")
            Button("dismiss") {
                dismiss()
            }
        }
        .padding()
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("show SwiftUI", for: .normal)
        button.addTarget(self, action: #selector(showPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func showPressed() {
        let hosting = UIHostingController(rootView: SwifuiView())
        hosting.modalPresentationStyle = .fullScreen
        present(hosting, animated: true)
    }
}
