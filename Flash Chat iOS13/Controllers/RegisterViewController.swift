//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // Both optionals have to not be nil
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
                if let e = error {
                    // error in local language - Add into a Label
                    print(e.localizedDescription)
                } else {
                    // Success - Navigate to ChatViewController
                    // Simulator Error OK - due to error: iCloud Keychain is disabled
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
                
            }
        }
        
    }
    
}
