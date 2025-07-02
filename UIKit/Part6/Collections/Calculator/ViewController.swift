//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class PhotoViewController: UIViewController {

    private var photosByYear: [Int: [Photo]] = [:]
    private var years: [Int] = []

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureData()
        setupCollectionView()
    }

    private func configureData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"

        let samplePhotos: [Photo] = [
            Photo(imageName: "1", title: "Me", date: formatter.date(from: "2024/12/11")!, isFavorite: false),
            Photo(imageName: "2", title: "Again me", date: formatter.date(from: "2024/12/12")!, isFavorite: false),
            Photo(imageName: "3", title: "Also me", date: formatter.date(from: "2025/04/28")!, isFavorite: false),
            Photo(imageName: "4", title: "me?", date: formatter.date(from: "2025/05/02")!, isFavorite: false),
            Photo(imageName: "5", title: "Maybe me", date: formatter.date(from: "2025/05/03")!, isFavorite: false),
            Photo(imageName: "6", title: "My photo", date: formatter.date(from: "2025/05/04")!, isFavorite: false),
            Photo(imageName: "7", title: "Photo by me", date: formatter.date(from: "2025/05/05")!, isFavorite: false),
            Photo(imageName: "8", title: "Looks like me", date: formatter.date(from: "2025/05/05")!, isFavorite: false),
        ]

        for photo in samplePhotos {
            let year = Calendar.current.component(.year, from: photo.date)
            photosByYear[year, default: []].append(photo)
        }

        years = photosByYear.keys.sorted()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegate
extension PhotoViewController: UICollectionViewDelegate {
    // I know that this is not swipe to delete, but I found only this way to do it((( If it is possible, explain me please how to do swipe int collection view. In tableView it is super easy =)
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { [weak self] _ in
                guard let self = self else { return }
                self.deleteImage(at: indexPath)
            }

            return UIMenu(title: "", children: [deleteAction])
        }
    }
    
    private func deleteImage(at indexPath: IndexPath) {
        let year = years[indexPath.section]
        photosByYear[year]?.remove(at: indexPath.item)
        if photosByYear[year]?.isEmpty == true {
            photosByYear.removeValue(forKey: year)
            if let index = years.firstIndex(of: year) {
                years.remove(at: index)
            }
            collectionView.reloadData()
        } else {
            collectionView.deleteItems(at: [indexPath])
        }
    }

}

// MARK: - UICollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return years.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let year = years[section]
        return photosByYear[year]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }

        let year = years[indexPath.section]
        if let photo = photosByYear[year]?[indexPath.item] {
            cell.configure(with: photo)
            cell.favoriteAction = { [weak self] in
                self?.photosByYear[year]?[indexPath.item].isFavorite.toggle()
                self?.collectionView.reloadItems(at: [indexPath])
                let message = photo.isFavorite ? "Removed \(photo.title) from Favorites." : "Marked \(photo.title) as Favorite!"
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = UIDevice.current.orientation.isLandscape ? 5 : 3
        let spacing: CGFloat = 10 * (columns + 1)
        let totalWidth = collectionView.bounds.width - spacing
        let width = totalWidth / columns
        return CGSize(width: width, height: width + 20)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }
        header.titleLabel.text = "\(years[indexPath.section])"
        return header
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 40)
    }
}
