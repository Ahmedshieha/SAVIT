//
//  Sign In.swift
//  SAVIT
//
//  Created by Reda on 07/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import UIKit


class SignIn   {
    
    
    static func login (_ combletionHandler : @escaping ()->() , email : String , password : String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                return
                    
            }
            combletionHandler()
            
            }
            
        }
    
}
