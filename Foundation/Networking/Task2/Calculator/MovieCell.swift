//
//  MovieCell.swift
//  Calculator
//
//  Created by Suren Kazaryan on 11.07.25.
//

import UIKit

class MovieCell: UICollectionViewCell {
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContent(name: String, backdrop_path: String) {
        nameLabel.text = name
        if let url: URL = URL(string: "https://image.tmdb.org/t/p/w500/\(backdrop_path)") {
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { data, _, _ in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
}

// MARK: - private methods
extension MovieCell {
    private func setup() {
        addSubviews(views: [
            movieImageView,
            nameLabel,
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            movieImageView.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor, multiplier: 1.0),
            movieImageView.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor, multiplier:  1.0),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 15),
            nameLabel.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15),
        ])
    }
}
