//
//  WeatherService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 14/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.

// 
//

import Foundation

class WeatherService {
    
    //MARK: - Attributes
    var session: URLSession
    var task: URLSessionTask?
    
    //MARK: - Methods
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
   
    //Get weather to the openweathermap API
    func getWeather(callback: @escaping (Bool, WeatherDecodable?) -> Void) {
        task?.cancel()
      
        guard let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/group?id=5128638,2983154&units=metric&appid=c0c3352eed0b11d7ee13876326e5a710") else {return}
        
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
                
                guard let responseJSON = try? JSONDecoder().decode(WeatherDecodable.self, from: data) else {
                    callback(false, nil)
                    print("NO ResponseJson")
                    return
                }
                callback(true, responseJSON)
            }
            
        })
        task?.resume()
    }
    
   
}
