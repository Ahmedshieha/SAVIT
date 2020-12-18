//
//  SignUPViewController.swift
//  SAVIT
//
//  Created by Reda on 12/8/20.
//  Copyright © 2020 Reda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
class SignUPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
  func signUp () {
     FirebaseAuth.Auth.auth().createUser(withEmail:emailTextField.text!, password: passwordTextField.text!) { (result, error) in
        guard error == nil else {
            self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
        self.alert(title: "Succes", message: "you have create account")
                    
            }
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        signUp()
    }
    
}
