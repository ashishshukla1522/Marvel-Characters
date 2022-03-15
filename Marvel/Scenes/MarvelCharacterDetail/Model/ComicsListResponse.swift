//
//  ComicsListResponse.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation

struct ComicListResponse : Codable{
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: ComicList?
}

struct ComicList : Codable {
    let offset, limit, total, count: Int?
    let results: [ComicInfo]?
}

// MARK: - Result
struct ComicInfo : Codable {
    let id : Int?
    let title: String?
    let resultDescription: String?
    let thumbnail: ComicThumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case thumbnail
    }
    
}

// MARK: - Thumbnail
struct ComicThumbnail : Codable {
    let path: String?
    let thumbnailExtension: String?
    
    var fullPath: String? {
        return [path ?? "", thumbnailExtension ?? ""].joined(separator: ".")
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
