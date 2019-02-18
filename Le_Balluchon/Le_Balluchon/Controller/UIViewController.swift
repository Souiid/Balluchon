//
//  UIViewController.swift
//  Le_Balluchon
//
//  Created by Souissi idriss2 on 05/02/2019.
//  Copyright © 2019 Souissi idriss2. All rights reserved.
//

import UIKit



    extension UIViewController {
        
        func presentAlert(message: String) {
            let alertVc = UIAlertController(title: "Zéro", message: message, preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alertVc, animated: true, completion: nil)
        }
    }


