//
//  SignUpViewController.swift
//  Firebase
//
//  Created by Kelvin on 11/22/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//
import Firebase
import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var signUpEmail: UITextField!
    @IBOutlet weak var signUpPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createAccountPressed(_ sender: Any) {
        if signUpEmail.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter your email/password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: signUpEmail.text!, password: signUpPassword.text!) { (user, error) in
                if error == nil {
                    let view = self.storyboard?.instantiateViewController(withIdentifier: "LoginPage")
                    self.present(view!, animated: true, completion:nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }
}
