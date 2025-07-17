//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        mainView.loadButton.addTarget(self, action: #selector(loadPressed), for: .touchUpInside)
        mainView.saveButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    func saveFile(fileName: String, text: String) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            showAlarm(message: "No document")
            return
        }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                let fileHandle = try FileHandle(forWritingTo: fileURL)
                fileHandle.seekToEndOfFile()
                if let data = text.data(using: .utf8) {
                    fileHandle.write(data)
                    fileHandle.closeFile()
                    showAlarm(title: "Message", message: "Success added")
                }
            } catch {
                showAlarm(message: "\(error)")
            }
        } else {
            do {
                try text.write(to: fileURL, atomically: true, encoding: .utf8)
                showAlarm(title: "Message", message: "Success")
            } catch {
                showAlarm(message: "\(error)")
            }
        }
    }
    
    func loadFile(fileName: String) -> String {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            showAlarm(message: "No document")
            return ""
        }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)

        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            return content
        } catch {
            showAlarm(message: "\(error)")
            return ""
        }
    }
    
    @objc func savePressed() {
        let fileName = mainView.giveName()
        let text = mainView.giveText()
        saveFile(fileName: fileName, text: text)
    }
    
    @objc func loadPressed() {
        let fileName = mainView.giveName()
        mainView.loadText(text: loadFile(fileName: fileName))
    }
}
