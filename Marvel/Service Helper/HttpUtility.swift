//
//  HttpUtility.swift
//  Marvel
//
//  Created by Apple on 09/03/22.
//

import Foundation

struct HttpUtility {
    static func getApiData<T:Decodable>(requestUrl: URLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?, _ _error: ErrorType?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                
                print(dataToJSON(data: responseData!) as Any)
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(result, nil)
                }
                catch let error{
                    completionHandler(nil, .ParsingError)
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }else {
                completionHandler(nil,.ErrorInFetchingDataFromServer)
            }
        }.resume()
    }
    
    static func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    // MARK: Show progress hud
    
}
