//
//  Authenticator.swift
//  Marvel
//
//  Created by Apple on 11/03/22.
//

import Foundation
import CryptoKit

class MD5KeyRetriver {
    func getMd5HasableKey(stringToHash:String) -> String{
        return md5Hash(stringToHash)!
    }
    
    func md5Hash(_ source: String) -> String? {
        guard let data = source.data(using: .utf8) else { return nil }
        return Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
    }
}
