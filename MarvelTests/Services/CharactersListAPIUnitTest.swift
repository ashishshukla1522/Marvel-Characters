//
//  CharactersListAPIUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
@testable import Marvel

class CharactersListAPIUnitTest: XCTestCase {

    func test_CharacterListAPIResource_With_ValidParameters_Returns_CharactersListResponse() {
        //Arrange
        let resource = CharactersListResource()
        let expectations =  self.expectation(description: "ValidParameters_Returns_CharactersListResponse")
        //Act
        resource.fetchCharactersList(isHud: true, currentOffSet: 0) { result in
            //Assert
            XCTAssertNotNil(result)
            XCTAssertEqual("Ok", result?.status)
            XCTAssertEqual(result?.code, 200)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_CharacterListAPIResource_With_InValidParameters_Returns_Error () {
        //Arrange
        let resource = CharactersListResource()
        let expectations =  self.expectation(description: "InValidParameters_Returns_Error")
        
        //Act
        resource.fetchCharactersList(isHud: true, currentOffSet: -1) { result in
            
            //Assert
            XCTAssertNil(result?.data)
            XCTAssertEqual(500, result?.code)
            XCTAssertEqual("Internal Server Error", result?.status)
            XCTAssertNotEqual(result?.code, 200)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    

}
