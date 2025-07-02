//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupImageView()
    }

}

// MARK: - Private functions
extension ViewController {
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 10.0

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    
    private func setupImageView() {
        guard let image = UIImage(named: "ariboon") else {
            print("wtf")
            return
        }

        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)

        let imageRatio = image.size.height / image.size.width
        let scrollViewWidth = view.bounds.width - 40
        let scaledHeight = scrollViewWidth * imageRatio

        imageView.frame = CGRect(x: 0, y: 0, width: scrollViewWidth, height: scaledHeight)
        scrollView.contentSize = imageView.frame.size

        centerImage()
    }

    private func getScaledHeight(for image: UIImage) -> CGFloat {
        let scrollViewWidth = view.bounds.width - 40
        let imageRatio = image.size.height / image.size.width
        return scrollViewWidth * imageRatio
    }

    private func centerImage() {
        let offsetX = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
        let offsetY = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
        scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerImage()
    }
}
