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
}
