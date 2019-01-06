//
//  TranslationService.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 06/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

class TranslationService {
    
    let translateURL = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    let translationURL = URL(string: "https://translation.googleapis.com/language/translate/v2?q=hello&target=fr&key=AIzaSyDucJCPjzy0CKhZebU1BO85AqIkPA_Ecto&source=en")!
    var task: URLSessionTask?
    
    //let translationController = TranslationController()
    
    func getTranslation(callback: @escaping (Bool, String)->Void){
        let request = createRequest()
        let session = URLSession(configuration: .default)
        
        task = session.dataTask(with: translationURL, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    callback(false, "")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("noresponse")
                    callback(false, "")
                    return
                }
                
                //                guard let responseJSON = try? JSONDecoder().decode(Translation.self, from: data) else {
                //                    //print(<#T##items: Any...##Any#>)
                //                    callback(false, "")
                //                    return
                //                }
                
                // let translation = responseJSON.translation["translatedText"]
                //print("Translation : ", translation)
                
                
                print("data : ", data)
                
            }
        })
        task?.resume()
}

    func createRequest()->URLRequest {
        // let textToTranslate = translationController.textToTranslate
        // print("Text To TRANSLATE : ", textToTranslate)
        var request = URLRequest(url: translateURL)
        request.httpMethod = "POST"
        let body = "q=hello&target=fr&key=AIzaSyACLgUNug4UHOoMrOrhoryp-iMepoQh7Yw&source=en"
        // q=\(translationController.textToTranslate)
        request.httpBody = body.data(using: .utf8)
        return request
    }
}

