//
//  PagingManager.swift
//  Marvel
//
//  Created by Apple on 13/03/22.
//

import Foundation

protocol PagingInfo {
    func checkIfThereAreMoreContentToLoad(_ limit:Int) -> Bool
    func getNewOffSet() -> Int
    func updateCurrentPagingInfo(currentOffSet:Int,totalDataCount:Int)
}

class PagingManager : PagingInfo {
    
    private var totalDataCount : Int?
    private var offSet:Int?
    func updateCurrentPagingInfo(currentOffSet:Int,totalDataCount:Int) {
        self.totalDataCount = totalDataCount
        self.offSet = currentOffSet
    }
    
    func getTotalDataInTheList(totalData:Int) {
        self.totalDataCount = totalData
    }
    
    func checkIfThereAreMoreContentToLoad(_ currentCount:Int) -> Bool {
        return currentCount < ((totalDataCount ?? 0) - 1)
    }
    
    func getNewOffSet() -> Int {
        return (offSet ?? 0) + 10
    }
}
