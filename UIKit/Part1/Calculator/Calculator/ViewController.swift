//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {

    private var displayLabel: UILabel!
    private var currentInput = ""
    private var firstOperand: Double?
    private var operation: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDisplay()
        setupButtonsManually()
    }

    private func setupDisplay() {
        displayLabel = UILabel(frame: CGRect(x: 20, y: 80, width: view.frame.width - 40, height: 80))
        displayLabel.backgroundColor = .lightGray
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 32)
        displayLabel.text = "0"
        view.addSubview(displayLabel)
    }

    private func createButton(title: String, frame: CGRect) {
        let button = UIButton(type: .system)
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    private func setupButtonsManually() {
        let size: CGFloat = 80
        let pad: CGFloat = 10
        let startX: CGFloat = 20
        let startY: CGFloat = 200

        createButton(title: "1", frame: CGRect(x: startX, y: startY, width: size, height: size))
        createButton(title: "2", frame: CGRect(x: startX + size + pad, y: startY, width: size, height: size))
        createButton(title: "3", frame: CGRect(x: startX + 2 * (size + pad), y: startY, width: size, height: size))
        createButton(title: "4", frame: CGRect(x: startX, y: startY + size + pad, width: size, height: size))
        createButton(title: "5", frame: CGRect(x: startX + size + pad, y: startY + size + pad, width: size, height: size))
        createButton(title: "6", frame: CGRect(x: startX + 2 * (size + pad), y: startY + size + pad, width: size, height: size))
        createButton(title: "7", frame: CGRect(x: startX, y: startY + 2 * (size + pad), width: size, height: size))
        createButton(title: "8", frame: CGRect(x: startX + size + pad, y: startY + 2 * (size + pad), width: size, height: size))
        createButton(title: "9", frame: CGRect(x: startX + 2 * (size + pad), y: startY + 2 * (size + pad), width: size, height: size))
        createButton(title: "0", frame: CGRect(x: startX + size + pad, y: startY + 3 * (size + pad), width: size, height: size))
        createButton(title: "C", frame: CGRect(x: startX, y: startY + 3 * (size + pad), width: size, height: size))
        createButton(title: "=", frame: CGRect(x: startX + 2 * (size + pad), y: startY + 3 * (size + pad), width: size, height: size))
        createButton(title: "+", frame: CGRect(x: startX + 3 * (size + pad), y: startY, width: size, height: size))
        createButton(title: "-", frame: CGRect(x: startX + 3 * (size + pad), y: startY + size + pad, width: size, height: size))
        createButton(title: "*", frame: CGRect(x: startX + 3 * (size + pad), y: startY + 2 * (size + pad), width: size, height: size))
        createButton(title: "/", frame: CGRect(x: startX + 3 * (size + pad), y: startY + 3 * (size + pad), width: size, height: size))
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }

        switch title {
        case "0"..."9":
            currentInput += title
            displayLabel.text = currentInput
        case "+", "-", "*", "/":
            firstOperand = Double(currentInput)
            operation = title
            currentInput = ""
        case "=":
            guard let op = operation,
                  let first = firstOperand,
                  let second = Double(currentInput) else { return }

            var result: Double = 0
            if op == "+" {
                result = first + second
            } else if op == "-" {
                result = first - second
            } else if op == "*" {
                result = first * second
            }  else if op == "/" {
                result = first / second
            }
            displayLabel.text = String(result)
            currentInput = String(result)
            operation = nil
            firstOperand = nil
        case "C":
            currentInput = ""
            firstOperand = nil
            operation = nil
            displayLabel.text = "0"
        default:
            break
        }
    }
}
