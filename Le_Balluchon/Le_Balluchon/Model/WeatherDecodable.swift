//
//  WeatherDecodable.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 16/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//



// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)



// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct WeatherDecodable: Decodable {
    let cnt: Int
    let list: [List]
}

struct List: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let name: String
}

struct Clouds: Decodable {
    let all: Int
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let main, description: String
}

struct Wind: Decodable {
    let speed, deg: Double
}



