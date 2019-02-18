//
//  TranslationDecodable.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 07/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import Foundation

struct Translaltion: Decodable {
    let data: TranslationData
}

struct TranslationData: Decodable {
     let translations: [TranslationText]
}

struct TranslationText: Decodable {
    let translatedText: String
}








