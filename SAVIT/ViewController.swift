//
//  ViewController.swift
//  SAVIT
//
//  Created by Reda on 12/7/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        login()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func login () {
        FirebaseAuth.Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            guard error == nil else {
                self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
            
            }
            
        }
    
    
   
        
    }
    
extension UIViewController {
    func alert (title : String , message : String){
           
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
           present(alert,animated: true)
           }
    
}
    

