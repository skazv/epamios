//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

struct AppConfig: Codable {
    let imageName: [String]
    let imageCount: Int
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        if let config = loadConfig() {
            let images = loadImages(names: config.imageName, count: config.imageCount)
            var y: CGFloat = 0
            for image in images {
                let imageView = UIImageView(image: image)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.frame = CGRect(x: 0, y: y, width: 300, height: 200)
                imageView.contentMode = .scaleAspectFit
                view.addSubview(imageView)
                y += 250
            }
        }
    }
    
    private func loadConfig() -> AppConfig? {
        if let url = Bundle.main.url(forResource: "config", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                if let config = try? JSONDecoder().decode(AppConfig.self, from: data) {
                    return config
                } else {
                    print("asd")
                }
            } else {
                print("asdfa")
            }
        } else {
            print("asdfasdfasd")
        }
        return nil
    }
    
    
    private func loadImages(names: [String], count: Int) -> [UIImage] {
        var images: [UIImage] = []
        var num: Int = 0
        for name in names {
            if num < count {
                if let image = UIImage(named: name) {
                    images.append(image)
                } else {
                    print("sdfgsdfg")
                }
                num += 1
            }
        }
        return images
    }
}
