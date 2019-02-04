//
//  WeatherViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 14/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    let weatherService = WeatherService()
   
    @IBOutlet var townNameLabel: [UILabel]!
    
    @IBOutlet var descriptionsLabel: [UILabel]!
    @IBOutlet var temperaturesLabel: [UILabel]!
    @IBOutlet var cloudLabel: [UILabel]!
    @IBOutlet var windLabel: [UILabel]!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        displayWeather()
    }
    
    func displayWeather() {
        weatherService.getWeather { (success, responseJSON) in
            if success {
                guard let responseJSON = responseJSON else {return}
//                for i in 0...1 {
//                    self.townNameLabel[i].text = responseJSON.list[i].name
//                    self.descriptionsLabel[i].text = responseJSON.list[i].weather[i].description
//                    self.temperaturesLabel[i].text = String(responseJSON.list[i].main.temp) + " °C"
//                    self.cloudLabel[i].text = String(responseJSON.list[i].clouds.all) + " % of sky"
//                    self.windLabel[i].text = String(responseJSON.list[i].wind.speed) + " nodes"
//                }
                self.townNameLabel[0].text = responseJSON.list[0].name
                 self.temperaturesLabel[0].text = String(responseJSON.list[0].main.temp) + " °C"
                self.temperaturesLabel[1].text = String(responseJSON.list[1].main.temp) + " °C"
            }
            
        }
     }
}
    
    
    
    



