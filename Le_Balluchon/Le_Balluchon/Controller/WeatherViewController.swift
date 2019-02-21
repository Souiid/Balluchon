//
//  WeatherViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 14/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
     //MARK: - Attributes and OUTLETS
    
    let weatherService = WeatherService()
    @IBOutlet var townNameLabel: [UILabel]!
    @IBOutlet var descriptionsLabel: [UILabel]!
    @IBOutlet var temperaturesLabel: [UILabel]!
    @IBOutlet var cloudLabel: [UILabel]!
    @IBOutlet var windLabel: [UILabel]!
    
     //MARK: - Methods and Actions
    
   override func viewDidLoad() {
        super.viewDidLoad()
        displayWeather()
    }
    
    //Display weather to the labels
    func displayWeather() {
        weatherService.getWeather { (success, responseJSON) in
            print("Success : ", success)
            if success {
               
                guard let responseJSON = responseJSON else {return}
                for i in 0..<2 {
                    self.townNameLabel[i].text = responseJSON.list[i].name
                    self.descriptionsLabel[i].text = "Description : " + responseJSON.list[i].weather[0].description
                    self.temperaturesLabel[i].text = "Temperature : " + String(responseJSON.list[i].main.temp) + " °C"
                    self.cloudLabel[i].text = "Cloud : " + String(responseJSON.list[i].clouds.all) + " % of sky"
                    self.windLabel[i].text = "Wind : " + String(responseJSON.list[i].wind.speed) + " nodes"
                }
            }
            
        }
    }
}
    
    
    
    



