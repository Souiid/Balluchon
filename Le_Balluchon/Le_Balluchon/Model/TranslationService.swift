//
//  TranslationService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 06/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class TranslationService {
    
    let translationURL = URL(string: "https://www.googleapis.com/language/translate/v2?key=AIzaSyACLgUNug4UHOoMrOrhoryp-iMepoQh7Yw&source=fr&target=en&format=text&q=Bonjour")!
    var task: URLSessionTask?
    
   
    
    func getTranslation(text: String, callback: @escaping (Bool, String?)->Void){
       
        guard let url = URL(string: createRequest(text: text)) else {return}
        let session = URLSession(configuration: .default)
        
        task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    print("no data")
                    callback(false, nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("noresponse")
                    callback(false, nil)
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Translaltion.self, from: data) else {
                    
                    print("no decode")
                    callback(false, nil)
                    return
                }
                callback(true, responseJSON.data.translations[0].translatedText)
               
                
            
               
                
                
                print("data : ", data)
                
            }
        })
        task?.resume()
}

    func createRequest(text: String)->String {
       let baseURL = "https://www.googleapis.com/language/translate/v2?key=AIzaSyACLgUNug4UHOoMrOrhoryp-iMepoQh7Yw&source=fr&target=en&format=text&q="
        
        guard let textEncoded = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return ""}
        let stringUrl = baseURL + textEncoded
        return stringUrl
    }
}

