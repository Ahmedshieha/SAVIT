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



@available(iOS 13.0, *)
class ViewController: UIViewController {


    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
//        SignIn.login(self.goToDashBoardViewController, email: emailTextField.text!, password: passwordTextField.text!)
        
        login {
            self.goToDashBoardViewController()
        }
            
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        self.goToSignUp()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func forgotButton(_ sender: Any) {
        
    }
    
    func goToSignUp () {
        let signUPViewController = UIStoryboard(name: "Main", bundle: nil)
        let SignUPViewController = signUPViewController.instantiateViewController(withIdentifier: "SignUPViewController")
        SignUPViewController.modalPresentationStyle = .fullScreen
        self.present(SignUPViewController, animated: true, completion: nil)
    }
    
    func login (_ combletionHandler : @escaping ()->()) {
        FirebaseAuth.Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            guard error == nil else {
                self.alert(title: "Error", message: error!.localizedDescription)
                return
            }
            combletionHandler()
            
            }
            
        }
    
     
    }
    




