//
//  Le_BalluchonTests.swift
//  Le_BalluchonTests
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import XCTest

@testable import Le_Balluchon

class BalluchonTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    //MARK: - RateService
    
    func testGetRateShouldPostFailedCallbackIfError() {
        // Given
        let rateService = ExchangeRateService(
            session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        rateService.getRate { (success, rate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(rate)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRateShouldPostFailedCallbackIfNoData() {
        // Given
        let rateService = ExchangeRateService(
            session: URLSessionFake(data: nil, response: nil, error: nil))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        rateService.getRate { (success, rate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(rate)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRateShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let rateService = ExchangeRateService(
            session: URLSessionFake(
                data: FakeResponseData.rateCorrectData,
                response: FakeResponseData.responseKO,
                error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        rateService.getRate { (success, rate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(rate)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRateShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let rateService = ExchangeRateService(
            session: URLSessionFake(
                data: FakeResponseData.testIncorrectData,
                response: FakeResponseData.responseOK,
                error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        rateService.getRate { (success, rate) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(rate)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetRateShouldPostSuccessCallbackIfCorrectData() {
        // Given
        let rateService = ExchangeRateService(
            session: URLSessionFake(
                data: FakeResponseData.rateCorrectData,
                response: FakeResponseData.responseOK,
                error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        rateService.getRate { (success, rate) in
            // Then
            XCTAssertTrue(success)
            XCTAssertEqual(rate, 1.139608)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    //MARK: - TranslationService
    
    func testGetTranslationShouldPostFailedCallbackIfError() {
        // Given
        let translationService = TranslationService(
            session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour") { (success, translation) in
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
        translationService.getTranslation(text: "Bonjour") { (success, translation) in
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
        translationService.getTranslation(text: "Bonjour") { (success, translation) in
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
        translationService.getTranslation(text: "Bonjour") { (success, translation) in
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
        translationService.getTranslation(text: "Bonjour") { (success, translation) in
            // Then
            XCTAssertTrue(success)
            XCTAssertEqual(translation, "Hello")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
