//
//  HttpUtility.swift
//  Marvel
//
//  Created by Apple on 09/03/22.
//

import Foundation

struct HttpUtility {
    func getApiData<T:Decodable>(requestUrl: URLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                
                print(dataToJSON(data: responseData!) as Any)
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
//        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
//            if(error == nil && responseData != nil && responseData?.count != 0)
//            {
//
//                print(dataToJSON(data: responseData!) as Any)
//                let decoder = JSONDecoder()
//                do {
//                    let result = try decoder.decode(T.self, from: responseData!)
//                    _ = completionHandler(result)
//                }
//                catch let error{
//                    debugPrint("error occured while decoding = \(error.localizedDescription)")
//                }
//            }
//
//        }.resume()
    }
    
    func dataToJSON(data: Data) -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }
    // MARK: Show progress hud

}
