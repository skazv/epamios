//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

let apiKey: String = "7481bbcf1fcb56bd957cfe9af78205f3"

class ViewController: UIViewController {
    let cellid = "MovieCell"
    let sectionInserts = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    var results: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        fetchTopMovies()
        //print(FileManager.default.temporaryDirectory.path)

    }
    
    func fetchTopMovies() {
        let urlString: String = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                do {
                    let topRate = try JSONDecoder().decode(TopRate.self, from: data)
                    DispatchQueue.main.async {
                        self.results = topRate.results
                        self.collectionView.reloadData()
                    }
                }
                catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

// MARK: - private methods
extension ViewController {
    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellid)
        
        view.addSubviews(views: [
            collectionView,
            clearButton,
        ])
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: clearButton.safeAreaLayoutGuide.topAnchor, constant: -15),
            
            clearButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            clearButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            clearButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
        ])
    }
    
    private func giveItemWidth() -> CGFloat {
        var itemWidth: CGFloat
        itemWidth = view.frame.width
        return itemWidth
    }
    
    @objc private func clearButtonTapped() {
        CacheManager.shared.clearCache()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! MovieCell
        let movie = results[indexPath.row]
        
        cell.addContent(name: movie.name, image: nil)

        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)") {
            CacheManager.shared.downloadImage(from: url) { image in
                DispatchQueue.main.async {
                    if let visibleCell = collectionView.cellForItem(at: indexPath) as? MovieCell {
                        visibleCell.addContent(name: movie.name, image: image)
                    }
                }
            }
        }
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = giveItemWidth()
        return CGSize(width: width, height: width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sectionInserts.left, left: sectionInserts.left, bottom: sectionInserts.left, right: sectionInserts.right)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
}
