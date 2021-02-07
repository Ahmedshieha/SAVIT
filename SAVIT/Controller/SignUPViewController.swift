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
@available(iOS 13.0, *)
class SignUPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        confirmEmailTextField.borderStyle = .none
        confirmPasswordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry  = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    func signUp (_ combletionHandler : @escaping ()->()) {
     FirebaseAuth.Auth.auth().createUser(withEmail:confirmEmailTextField.text!, password: confirmPasswordTextField.text!) { (result, error) in
        guard error == nil else {
            self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
        combletionHandler()
                    
            }
    }
    @IBAction func signInButton(_ sender: Any) {
        goToSignIn()
    }
    
    
    func goToSignIn () {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = viewController.instantiateViewController(withIdentifier: "ViewController")
    
        ViewController.modalPresentationStyle = .pageSheet
        self.present(ViewController, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if emailTextField.text == confirmEmailTextField.text && passwordTextField.text == confirmPasswordTextField.text {
            
            signUp {
                self.goToDashBoardViewController()
            }
        }
        else {
            alert(title: "Error", message: "something error")
        }
        
        
        
    }
    
}
