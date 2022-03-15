//
//  ImageRequestManager.swift
//  Marvel
//
//  Created by Apple on 12/03/22.
//

import Foundation

class ImageRequestManager {
    static let shared = ImageRequestManager()
    private let imageSessionManager = URLSession(configuration: .default)
    typealias response = ((Data?, Error?) -> ())
    
    func getImageData(thumbnailURL:URLRequest, completion:@escaping response) {
        imageSessionManager.dataTask(with: thumbnailURL) { data, _, error in
            completion(data, error)
        }.resume()
    }
}
