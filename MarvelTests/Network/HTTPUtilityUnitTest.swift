//
//  HTTPUtilityUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
@testable import Marvel

class HTTPUtilityUnitTest: XCTestCase {

    func testDowloading_Json_From_Server_with_ValidRequest_Returns_Success() {
        //Arrange
        let dummyUrl = URL(string: "https://gateway.marvel.com/v1/public/characters?apikey=87fe9836c8599f98f1378fc63e66ab33&hash=2e9b8589debc9b1aa244450fe95849ed&ts=7C2188AF-50E1-4330-9F8C-640A2E3EF6A1&offset=0&limit=10")
        let expectations = self.expectation(description: "ValidRequest_Returns_Success")
        
        //Act
        HttpUtility.getApiData(requestUrl: URLRequest(url: dummyUrl!), resultType: CharactersListResponse.self) { result,error  in
            //Assert
            XCTAssertNil(error)
            XCTAssertNotNil(result?.data)
            XCTAssertEqual(200, result?.code)
            XCTAssertEqual("Ok", result?.status)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
