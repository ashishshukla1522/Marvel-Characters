//
//  CharactersListViewModel.swift
//  MarvelTests
//
//  Created by Apple on 16/03/22.
//

import XCTest

@testable import Marvel

class CharactersListViewModelUnitTest: XCTestCase, CharactersListViewModelDelegate {
    func didRecieveCharactersList(response: CharactersListResponse?, error: ErrorType?) {
        XCTAssertNil(error)
        XCTAssertNotNil(response?.data)
    }

    func testCharactersList_WithValid_Parameters_Returns_Valid_Results() {
        //Arrange
        let charactersListViewModel = CharactersListViewModel(_delegate: self)
        charactersListViewModel.fetchCharactersList(offSet: 0)
    }

}
