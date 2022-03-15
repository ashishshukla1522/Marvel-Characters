//
//  CharacterDetailVcUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest

@testable import Marvel

class CharacterDetailVcUnitTest: XCTestCase {
    var detailController = ViewControllerAccessors.characterDetailVc
    
    override func setUp() {
        
    }
    
    func testIf_ComicsList_AreInitially_Empty() {
        let data = detailController.comicslistViewModel.comicListCellViewModels
        XCTAssertEqual(0, data.count)
    }
}
