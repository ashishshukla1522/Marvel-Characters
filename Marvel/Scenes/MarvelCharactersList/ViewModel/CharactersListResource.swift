//
//  CharactersListResource.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import Foundation
protocol CharactersListRepository {
    func fetchCharactersList(isHud:Bool,currentOffSet:Int, completion : @escaping (_ result: CharactersListResponse?,_ error:ErrorType?) -> Void)
}

struct CharactersListResource : CharactersListRepository {
    
    func fetchCharactersList(isHud:Bool,currentOffSet:Int, completion : @escaping (_ result: CharactersListResponse?,_ error:ErrorType?) -> Void) {
        let urlRequest = URLRetriever.marverlCharacters(offset: currentOffSet).generateUrlRequest()
        HttpUtility.getApiData(requestUrl: urlRequest, resultType: CharactersListResponse.self) { (apiResponse,error)  in
            if error == nil {
                completion(apiResponse, nil)
            }else {
                completion(nil, error)
            }
            
        }
    }
    
}
