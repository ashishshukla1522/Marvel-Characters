//
//  URLRetrieverUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest

@testable import Marvel

class URLRetrieverUnitTest: XCTestCase {

    func testCharactersList_Url() {
        //Arrange
        let urlRetriever = URLRetriever.marverlCharacters(offset: 0)
        
        //Asert
        XCTAssertEqual(urlRetriever.path, "characters")
        XCTAssertEqual(urlRetriever.urlParameters["offset"] as! Int, 0)
        XCTAssertEqual(urlRetriever.urlParameters["limit"] as! Int, 10)
    }
    
    func testComicList_Url() {
        //Arrange
        let urlRetriever = URLRetriever.comics(characterId: "1011334")
        
        //Assert
        XCTAssertEqual(urlRetriever.path, "characters/1011334/comics")
        XCTAssertEqual(urlRetriever.urlParameters["limit"] as! Int, 10)
    }
    
}
