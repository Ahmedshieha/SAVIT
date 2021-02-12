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
    @IBAction func loginButton(_ sender: UIButton) {
        
        login {
            self.goToTabBarViewController ()
        }
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        self.goToSignUp()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            goToTabBarViewController()
        } else {
        }
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true
        
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        toolBar.barStyle = .default
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(loginButton(_:)))
        toolBar.items = [doneButton]
        toolBar.isUserInteractionEnabled = true
        passwordTextField.inputAccessoryView = toolBar
        emailTextField.inputAccessoryView = toolBar

        
    }
    
    @IBAction func forgotButton(_ sender: Any) {
        
    }
    
    func hideKeyboard () {}
    
    func goToSignUp () {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signUPViewController = storyBoard.instantiateViewController(withIdentifier: "SignUPViewController")
        signUPViewController.modalPresentationStyle = .fullScreen
        self.present(signUPViewController, animated: true, completion: nil)
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
    
    func goToTabBarViewController () {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let TabBarViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
    TabBarViewController.modalPresentationStyle = .fullScreen
    self.present(TabBarViewController,animated: true , completion : nil)



    }
 
    

     
}

    




