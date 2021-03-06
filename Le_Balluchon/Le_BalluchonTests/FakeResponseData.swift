//
//  FakeResponseData.swift
//  Le_BalluchonTests
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class FakeResponseData {
    // MARK: - Data
    static var rateCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Rate", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    static var translationCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translation", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    static var translationCorrectDataFR: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "TranslationFR", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    static var weatherCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    
   
    static let testIncorrectData = "erreur".data(using: .utf8)!
    
    
    
    // MARK: - Response
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://test.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://test.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    
    // MARK: - Error
    class TestError: Error {}
    static let error = TestError()
}
