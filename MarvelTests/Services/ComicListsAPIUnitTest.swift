//
//  ComicListsAPIUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
@testable import Marvel
class ComicListsAPIUnitTest: XCTestCase {

    func test_ComicListAPIResource_With_ValidParameters_Returns_ComicListResponse() {
        //Arrange
        let resource = ComicsListResource()
        let expectations =  self.expectation(description: "ValidParameters_Returns_ComicListResponse")
        
        //Act
        resource.fetchComicsList(isHud: true, currentOffSet: 0, characterId: String(1011334)) { result,error  in
            //Assert
            XCTAssertNotNil(result)
            XCTAssertEqual("Ok", result?.status)
            XCTAssertEqual(result?.code, 200)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_ComicListAPIResource_With_InValidParameters_Returns_Error () {
        //Arrange
        let resource = ComicsListResource()
        let expectations =  self.expectation(description: "InValidParameters_Returns_ComicListResponse")
        
        //Act
        resource.fetchComicsList(isHud: true, currentOffSet: 0, characterId: String(888888)) { result,error  in
            //Assert
            XCTAssertNotNil(result)
            XCTAssertEqual("Ok", result?.status)
            XCTAssertEqual(result?.code, 200)
            XCTAssertEqual(0, result?.data?.results?.count)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
