//
//  UIViewController+Extensions.swift
//  SAVIT
//
//  Created by Reda on 07/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func alert (title : String , message : String){
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
           present(alert,animated: true)
           }
    
    
    
}
