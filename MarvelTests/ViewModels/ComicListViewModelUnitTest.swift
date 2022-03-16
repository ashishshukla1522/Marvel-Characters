//
//  ComicListViewModelUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 16/03/22.
//

import XCTest

@testable import Marvel

class ComicListViewModelUnitTest: XCTestCase, ComicsListViewModelDelegate {
    
    func testComicList_With_ValidParametres_Returns_ValidResults() {
        //Arrange
        let comicListViewModel = ComicsListViewModel( _delegate: self)
        
        //Act
        comicListViewModel.fetchComicsList(characterId: 1011334)
    }
    
    func didRecieveComicsList(response: ComicListResponse?, error: ErrorType?) {
        //Assert
        XCTAssertNotNil(response?.data)
        XCTAssertNil(error)
    }
    
}
