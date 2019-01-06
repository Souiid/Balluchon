//
//  TranslationViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 06/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {

    var translationService = TranslationService()
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var translateTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    
    var textToTranslate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
   @IBAction func displayTranslation() {
        guard let textToTranslate = inputTextField.text else {return}
        translationService.getTranslation { (success, translation) in
            if success {
                
                
            }
        }
    }

}
