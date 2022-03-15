//
//  CharactersListResource.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation
protocol CharactersListRepository {
    func fetchCharactersList(isHud:Bool,currentOffSet:Int, completion : @escaping (_ result: CharactersListResponse?) -> Void)
}

struct CharactersListResource : CharactersListRepository {
    
    func fetchCharactersList(isHud:Bool,currentOffSet:Int, completion : @escaping (_ result: CharactersListResponse?) -> Void) {
        let urlRequest = URLRetriever.marverlCharacters(offset: currentOffSet).generateUrlRequest()
        let httpUtility = HttpUtility()
            httpUtility.getApiData(requestUrl: urlRequest, resultType: CharactersListResponse.self) { (apiResponse) in
                _ = completion(apiResponse)
            }
    }

}
