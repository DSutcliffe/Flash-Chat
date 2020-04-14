//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        // Both optionals have to not be nil
        if let email = emailTextfield.text, let password = passwordTextfield.text {
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//                guard let strongSelf = self else { return }
            // Above code outdated and should be changed to...
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    // error in local language - Add into a Label
                    print(e.localizedDescription)
                } else {
                    // Success - Navigate to ChatViewController
                    // Simulator Error OK - due to error: iCloud Keychain is disabled
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
              
            }
        }
    }
    
}
