//
//  WeatherViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 14/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var weatherService = WeatherService()
    
    @IBOutlet weak var getWeatherButton: UIButton!
    
    @IBAction func getWeather(_ sender: Any) {
        weatherService.getWeather { (success, weatherID) in
            
        }
                
                
    }
}
    
    
    
    



