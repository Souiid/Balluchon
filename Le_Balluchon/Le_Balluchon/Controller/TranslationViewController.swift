//
//  TranslationViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 06/01/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit

class TranslationViewController: UIViewController {
//Renommer outlets
    let translationService = TranslationService()
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var controllerTitleLabel: UILabel!
    
    @IBOutlet weak var langageSegmentControl: UISegmentedControl!
    @IBOutlet weak var translateTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langageSegmentControl.selectedSegmentIndex = 0
        changeLanguage(langageSegmentControl)
    }
    
   @IBAction func displayTranslation() {
        guard let textToTranslate = inputTextField.text else {return}
        translationService.getTranslation(selectedIndex: langageSegmentControl.selectedSegmentIndex, text: textToTranslate) { (success, textTranslated) in
            guard let textTranslated = textTranslated else {return}
            self.translateTextView.text = textTranslated
        }
    }
    

    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            controllerTitleLabel.text = "Translation"
            translateButton.setTitle("Translate", for: .normal)
            translateTextView.text = "Translate"
        case 1:
            controllerTitleLabel.text = "Traduction"
            translateButton.setTitle("Traduire", for: .normal)
            translateTextView.text = "Traduction"
        default:
            return
        }
        
    }
    
    @IBAction func dismissKeybord(_ sender: UITapGestureRecognizer) {
        inputTextField.resignFirstResponder()
    }
    
}
