//
//  ImageLoader.swift
//  NBSMovie
//
//  Created by Ismail . on 15/10/20.
//

import SwiftUI
import UIKit

private let _imagecache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imagecache
    
    func loadImage(with url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async {
                    [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
