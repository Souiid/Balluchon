//
//  TranslationService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 06/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class TranslationService {
    
    
    var task: URLSessionTask?
    var session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getTranslation(selectedIndex: Int, text: String, callback: @escaping (Bool, String?)->Void){
       
        guard let url = URL(string: createUrlRequest(selectedIndex: selectedIndex, text: text)) else {return}
    
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

   private func createUrlRequest(selectedIndex: Int, text: String)->String {
        var baseURL: String
        switch selectedIndex {
        case 0:
            baseURL = "https://www.googleapis.com/language/translate/v2?key=AIzaSyACLgUNug4UHOoMrOrhoryp-iMepoQh7Yw&source=fr&target=en&format=text&q="
        case 1:
            baseURL = "https://www.googleapis.com/language/translate/v2?key=AIzaSyACLgUNug4UHOoMrOrhoryp-iMepoQh7Yw&source=en&target=fr&format=text&q="
        default:
            return ""
        }
       
        guard let textEncoded = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return ""}
        let stringUrl = baseURL + textEncoded
        return stringUrl
    }
}

