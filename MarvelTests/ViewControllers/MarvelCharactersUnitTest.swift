//
//  MarvelCharactersUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
@testable import Marvel

class MarvelCharactersUnitTest: XCTestCase {
    var charactersViewController: CharactersListVc!
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        charactersViewController = storyboard.instantiateViewController(withIdentifier: "CharactersListVc") as? CharactersListVc
        let _ = charactersViewController.view
    }
    
    
    
    func testIf_CharactersList_IsInitially_Empty() {
        //Arrange
        let charactersList = charactersViewController.charactersListViewModel.marvelCharacterCellViewModels
        
        //Assert
        XCTAssertEqual(0, charactersList.count)
    }


}
