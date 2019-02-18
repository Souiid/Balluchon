//
//  ExchangeRateViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 05/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    //MARK: - Attributes and OUTLETS
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    let exchangeRateService = ExchangeRateService()
    
    //MARK: - Methods and Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Action to use the callback and display rate
    @IBAction func validateValueToConvert(_ sender: Any) {
        
        guard let stringNumber = inputTextField.text else {return}
        
        guard let numberToConvert = Double(stringNumber) else {
            presentAlert(message: "You can't convert this number")
            return
            
        }
        
        exchangeRateService.getRate { (success, rate) in
            if success {
                guard let rate = rate else {return}
                print("Rate: ", rate)
                let convertNumber = rate * numberToConvert
                self.usdLabel.text = String(convertNumber) + " $"
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }
    
}




