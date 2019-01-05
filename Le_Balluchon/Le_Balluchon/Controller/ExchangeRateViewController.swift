//
//  ExchangeRateViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    
    // let exchangeRate = ExchangeRateService()
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    let exchangeRateService = ExchangeRateService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func validateValueToConvert(_ sender: Any) {
        
        guard let stringNumber = inputTextField.text else {return}
        guard let numberToConvert = Double(stringNumber) else {return}
        
        exchangeRateService.getRate { (success, rate) in
            if success {
                guard let rate = rate else {return}
                print("Rate: ", rate)
                let convertNumber = rate * numberToConvert
                self.usdLabel.text = String(convertNumber) + " $"
            }
        }
    }
}
