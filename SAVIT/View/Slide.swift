//
//  Slide.swift
//  SAVIT
//
//  Created by Reda on 09/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)


class Slide: UIView {

    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lableTitle: UITextView!
    @IBOutlet weak var labelDesc: UITextView!
    @IBOutlet weak var button: UIButton!
 
   
    func setUpSkipButton () {
        button.backgroundColor = .black
        button.setTitle("Skip", for: .normal)
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(skipButtonAction(sender:)), for: .touchUpInside)
    }
    let view = UIViewController()
    
    @IBAction func skipButtonAction(sender : UIButton!) {
        let stortBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = stortBoard.instantiateViewController(withIdentifier: "ViewController")
        changeRootViewController(newRootView: viewController)
     
    }


    func setUpStartButton () {
        button.backgroundColor = .systemGreen
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 10
    }
    func changeRootViewController(newRootView:UIViewController)
        {
            let mainWindow: UIWindow = UIApplication.shared.windows.first ?? UIWindow()
            mainWindow.rootViewController = newRootView
            mainWindow.makeKeyAndVisible()
        }
      
}
