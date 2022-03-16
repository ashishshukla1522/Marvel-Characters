//
//  ErrorHandlerUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 16/03/22.
//

import XCTest

@testable import Marvel

class ErrorHandlerUnitTest: XCTestCase {
    
    func testErrorHandler_With_Defined_Error_Returns_ValidResults() {
        //Arrange
        let viewController = UIViewController()
        
        ErrorHandler.handleErrorWith(error: .ErrorInFetchingDataFromServer, viewController: viewController)
        
    }
    
}
