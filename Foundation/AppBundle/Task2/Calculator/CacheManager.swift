//
//  CachManager.swift
//  Calculator
//
//  Created by Suren Kazaryan on 16.07.25.
//

import UIKit

class CacheManager {
    static let shared = CacheManager()
    private let cacheDir: URL
    
    private init() {
        self.cacheDir = FileManager.default.temporaryDirectory.appendingPathComponent("ImageCache", isDirectory: true)
        if !FileManager.default.fileExists(atPath: cacheDir.path) {
            try? FileManager.default.createDirectory(at: cacheDir, withIntermediateDirectories: true, attributes: nil)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(clearCache), name: UIApplication.didReceiveMemoryWarningNotification, object: nil)
    }

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let filename = url.lastPathComponent
        let fileURL = cacheDir.appendingPathComponent(filename)

        if let cachedImage = getCachedImage(at: fileURL) {
            completion(cachedImage)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
               if let data = data, let image = UIImage(data: data) {
                   try? data.write(to: fileURL)
                   completion(image)
               } else {
                   completion(nil)
               }
           }.resume()
    }

    private func getCachedImage(at url: URL) -> UIImage? {
        if FileManager.default.fileExists(atPath: url.path),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) {
               return image
           } else {
               return nil
           }
    }

    @objc func clearCache() {
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: cacheDir, includingPropertiesForKeys: nil, options: [])
            for file in contents {
                try FileManager.default.removeItem(at: file)
            }
            print("asdf")
        } catch {
            print("\(error)")
        }
    }
}
