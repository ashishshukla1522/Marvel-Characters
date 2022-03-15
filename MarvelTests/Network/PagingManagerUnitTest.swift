//
//  PagingManagerUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest

@testable import Marvel

class PagingManagerUnitTest: XCTestCase {

    func testTryRetriving_Correct_PagingInfo_With_ValidParameters() {
        let pagingManager = PagingManager()
        pagingManager.updateCurrentPagingInfo(currentOffSet: 0, totalDataCount: 100)
        let isLoadMoreData = pagingManager.checkIfThereAreMoreContentToLoad(10)
        XCTAssertEqual(true, isLoadMoreData)
        XCTAssertNotNil(pagingManager.getNewOffSet)
    }
}
