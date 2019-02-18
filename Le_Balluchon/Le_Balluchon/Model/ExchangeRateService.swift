//
//  ExchangeRateService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation


class ExchangeRateService {
    
    //MARK: - Attributes
    
    var session: URLSession
    var task: URLSessionTask?
    
    //MARK: - Methods
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
   //Method to get rate of fixer.io API
    func getRate(callback: @escaping (Bool, Double?) -> Void) {
        task?.cancel()
        guard let fixerUrl = URL(string: "http://data.fixer.io/api/latest?access_key=d0fdb72fd1a83139458ec4baca0ea2d1&symbols=USD") else {return}
        
        task = session.dataTask(with: fixerUrl, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                print("OK")
                
                guard let data = data, error == nil else {
                    print("no data")
                    callback(false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("noresponse")
                    callback(false, nil)
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(ExchangeRate.self, from: data) else {
                    callback(false, nil)
                    return
                }
                
                let rate = responseJSON.rates["USD"]
                callback(true, rate)
            }
            
        })
        task?.resume()
    }
    
   
    
  
    
    
}

