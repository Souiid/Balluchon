//
//  URLSessionDataTaskFake.swift
//  Le_BalluchonTests
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class URLSessionDataTaskFake: URLSessionDataTask {
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var data: Data?
    var urlResponse: URLResponse?
    var responseError: Error?
    
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    
    override func cancel() {}
}
