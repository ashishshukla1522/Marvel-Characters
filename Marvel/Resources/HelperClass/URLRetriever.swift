//
//  URLRetriever.swift
//  Marvel
//
//  Created by Apple on 12/03/22.
//

import Foundation

enum URLRetriever  {
    static let baseUrl = "https://gateway.marvel.com/v1/public/"
    static let marvelsApiKey = "87fe9836c8599f98f1378fc63e66ab33"
    static let marvelsPrivateKey = "e5d597e8124e18c1c8a96dc809e08f450ba0cb68"
    
    
    case marverlCharacters(offset: Int)
    case marvelCharacterDetails(charcaterId:String)
    case comics(characterId:String)
    
    var httpMethod: HTTPMethods {
        switch self {
        case .marverlCharacters,.marvelCharacterDetails,.comics:
            return .get
        }
    }
    
    var path : String {
        switch self {
        case .marverlCharacters:
            return "characters"
        case .comics(let characterId):
            return "characters/\(characterId)/comics"
        case .marvelCharacterDetails(let characterId):
            return "characters/\(characterId)"
        }
    }
    
    var urlParameters : [String:Any] {
        var parametrs = requiredParameters()
        switch self {
        case .marverlCharacters(let offset):
            parametrs["offset"] = offset
            return parametrs
        case .marvelCharacterDetails, .comics:
            return parametrs
        }
    }
    
    func generateUrlRequest() -> URLRequest {
        var urlComponents = URLComponents(string: URLRetriever.baseUrl)
        urlComponents?.path += path
        urlComponents?.queryItems = urlParameters.map {
            URLQueryItem(name: $0.key, value: $0.value is String ? $0.value as! String : String($0.value as! Int))
        }
        var urlRequest = URLRequest(url: urlComponents?.url ?? URL(string: URLRetriever.baseUrl)!)
        urlRequest.httpMethod = httpMethod.rawValue
        return urlRequest
    }
    
    func requiredParameters() -> [String: Any] {
        let ts = NSUUID().uuidString
        let hash = MD5KeyRetriver().getMd5HasableKey(stringToHash: (ts + URLRetriever.marvelsPrivateKey + URLRetriever.marvelsApiKey))
        var parameters = [String: Any]()
        parameters["apikey"] = URLRetriever.marvelsApiKey
        parameters["hash"] = hash
        parameters["ts"] = ts
        parameters["limit"] = 10
        return parameters
    }
    
}
