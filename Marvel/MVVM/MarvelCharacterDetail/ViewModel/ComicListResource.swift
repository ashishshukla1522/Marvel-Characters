//
//  ComicListResource.swift
//  Marvel
//
//  Created by Apple on 14/03/22.
//

import Foundation

protocol ComicListRepository {
    func fetchComicsList(isHud:Bool,currentOffSet:Int, characterId:String,completion : @escaping (_ result: ComicListResponse?) -> Void)
}

struct ComicsListResource : ComicListRepository {
    
    func fetchComicsList(isHud:Bool,currentOffSet:Int, characterId:String,completion : @escaping (_ result: ComicListResponse?) -> Void) {
        let urlRequest = URLRetriever.comics(characterId: characterId).generateUrlRequest()
        let httpUtility = HttpUtility()
            httpUtility.getApiData(requestUrl: urlRequest, resultType: ComicListResponse.self) { (apiResponse) in
                _ = completion(apiResponse)
            }
    }

}
