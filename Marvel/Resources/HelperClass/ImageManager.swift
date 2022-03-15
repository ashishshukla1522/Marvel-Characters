//
//  ImageRetriever.swift
//  Marvel
//
//  Created by Apple on 12/03/22.
//

import Foundation
import UIKit


class ImageManager {
    
    let imageCache = NSCache<AnyObject,AnyObject>()
    
    func downloadImageFromUrl(url: URL, completion: @escaping (UIImage?) -> Void) {
        ImageRequestManager.shared.getImageData(thumbnailURL: URLRequest(url: url)) { imageData, error in
            completion(imageData != nil ? UIImage(data: imageData!) : nil)
        }
        
    }
    
    func saveImageInCache(image: UIImage?, forkey key: String) {
        if let image = image {
            imageCache.setObject(image, forKey: key as AnyObject)
            
            let imageURL = imageURLForKey(key: key)
            if let data = image.jpegData(compressionQuality: 0.5) {
                try? data.write(to: imageURL, options: .atomicWrite)
            }
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        if let existingImage = imageCache.object(forKey: key as AnyObject) as? UIImage {
            return existingImage
        }
        
        let imageURL = imageURLForKey(key: key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        
        imageCache.setObject(imageFromDisk, forKey: key as AnyObject)
        return imageFromDisk
    }
    
    func imageURLForKey(key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(key)
    }
    
    
    
    
}
