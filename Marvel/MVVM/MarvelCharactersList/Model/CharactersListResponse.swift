//
//  CharactersListModel.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation


struct CharactersListResponse: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    var data: CharacterListInfo?
}


struct CharacterListInfo: Codable {
    var offset, limit, total, count: Int?
    var results: [CharactersInfo]?
}

// MARK: - Result
struct CharactersInfo: Codable {
    let id: Int?
    let name, resultDescription: String?
    
    let thumbnail: Thumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail
    }
}


// MARK: - Thumbnail
struct Thumbnail: Codable {
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



