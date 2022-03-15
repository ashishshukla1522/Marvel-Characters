//
//  ImageManagerUnitTest.swift
//  MarvelTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
@testable import Marvel

class ImageManagerUnitTest: XCTestCase {

    func testImage_Download_FromThe_Server_With_ValidUrl_Returns_ValidImage() {
        //Arrange
        let imageManager = ImageManager()
        let dummyUrl = "https://i.picsum.photos/id/168/200/200.jpg?hmac=VxnpUGg87Q47YRONmdsU2vNGSPjCs5vrwiAL-0hEIHM"
        let expectations = self.expectation(description: "ValidUrl_Returns_ValidImage")
        
        //Act
        imageManager.getImageFrom(url: URL(string: dummyUrl)!) { image, url in
            XCTAssertNotNil(image)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func testImage_Download_FromThe_Server_With_InValidUrl_Returns_InValidImage() {
        //Arrange
        let imageManager = ImageManager()
        let dummyUrl = "https://i.picsum.photos/id/"
        let expectations = self.expectation(description: "InValidUrl_Returns_ValidImage")
        
        //Act
        imageManager.getImageFrom(url: URL(string: dummyUrl)!) { image, url in            //Assert
            XCTAssertNil(image)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func test_Saving_Image_With_ValidUrl_ReturnsSuccess() {
        //Arrange
        let imageManager = ImageManager()
        let dummyUrl = "https://i.picsum.photos/id/168/200/200.jpg?hmac=VxnpUGg87Q47YRONmdsU2vNGSPjCs5vrwiAL-0hEIHM"
        let expectations = self.expectation(description: "ValidUrl_Returns_ValidImage")
        
        //Act
        imageManager.getImageFrom(url: URL(string: dummyUrl)!) { image, url in
            imageManager.saveImageInCache(image: image, forkey: "testImage")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_Retriving_Image_With_ValidKey_Returns_validImage() {
        //Arrange
        let imageManager = ImageManager()
        
        //Act
        let retrievedImage = imageManager.imageForKey(key: "testImage")
        XCTAssertNotNil(retrievedImage)
        
    }
    
    func test_Retriving_Image_With_InValidKey_Returns_validImage() {
        //Arrange
        let imageManager = ImageManager()
        
        //Act
        let retrievedImage = imageManager.imageForKey(key: "dummyImage")
        XCTAssertNil(retrievedImage)
        
    }

}
