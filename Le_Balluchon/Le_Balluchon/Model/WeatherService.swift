//
//  WeatherService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 14/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class WeatherService {
    
 let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London&APPID=c0c3352eed0b11d7ee13876326e5a710")!
    
    var session: URLSession
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    var task: URLSessionTask?
    
    
    func getWeather(callback: @escaping (Bool, Double?) -> Void) {
        task?.cancel()
       
        
        task = session.dataTask(with: weatherURL, completionHandler: { (data, response, error) in
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
                
//                guard let responseJSON = try? JSONDecoder().decode(ExchangeRate.self, from: data) else {
//                    callback(false, nil)
//                    return
//                }
                print("DATA : ", data)
            }
            
        })
        task?.resume()
    }
}
