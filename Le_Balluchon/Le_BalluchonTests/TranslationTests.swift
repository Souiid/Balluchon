//
//  TranslationTests.swift
//  Le_BalluchonTests
//
//  Created by Souissi idriss2 on 18/02/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import XCTest
@testable import Le_Balluchon

class TranslationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGetTranslationShouldPostFailedCallbackIfError() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(selectedIndex: 0, text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            expectation.fulfill()
        }
        
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfNoData() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(data: nil, response: nil, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(selectedIndex: 0, text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(
                data: FakeResponseData.translationCorrectData,
                response: FakeResponseData.responseKO,
                error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(selectedIndex: 0, text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(
                data: FakeResponseData.testIncorrectData,
                response: FakeResponseData.responseOK,
                error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(selectedIndex: 0, text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(translation)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostSuccessCallbackIfCorrectData() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(
                data: FakeResponseData.translationCorrectData,
                response: FakeResponseData.responseOK,
                error: nil))
        
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(selectedIndex: 0, text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertTrue(success)
            XCTAssertEqual(translation, "Hello")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testCreateURLSourceFRShouldCallbackTargetEN() {
        let translationService = TranslationService(
            session: URLSessionFake(
                data: FakeResponseData.translationCorrectDataFR,
                response: FakeResponseData.responseOK,
                error: nil))
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        translationService.getTranslation(selectedIndex: 1, text: "Hello") { (success, translation) in
            // Then
            XCTAssertTrue(success)
            
            XCTAssertEqual(translation, "Bonjour")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testCreateURLIndexSegControlWrongShouldReturnNil() {
        let translationService = TranslationService(
            session: URLSessionFake(
                data: FakeResponseData.translationCorrectData,
                response: FakeResponseData.responseOK,
                error: nil))
        
        
        translationService.getTranslation(selectedIndex: 2, text: "Hello") { (success, translation) in
            // Then
            XCTAssertFalse(success)
            
            XCTAssertEqual(translation, nil)
            
        }
        
    }

}
