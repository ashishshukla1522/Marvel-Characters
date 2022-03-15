//
//  ComicListResource.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation

protocol ComicListRepository {
    func fetchComicsList(isHud:Bool,currentOffSet:Int, characterId:String,completion : @escaping (_ result: ComicListResponse?,_ error: ErrorType?) -> Void)
}

struct ComicsListResource: ComicListRepository {
    
    func fetchComicsList(isHud:Bool,currentOffSet:Int, characterId:String,completion : @escaping (_ result: ComicListResponse?,_ error: ErrorType?) -> Void) {
        let urlRequest = URLRetriever.comics(characterId: characterId).generateUrlRequest()
        HttpUtility.getApiData(requestUrl: urlRequest, resultType: ComicListResponse.self) { (apiResponse,error) in
            completion(apiResponse, error)
        }
    }
    
}
