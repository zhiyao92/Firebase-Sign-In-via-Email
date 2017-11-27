//
//  ViewController.swift
//  Firebase
//
//  Created by Kelvin on 11/14/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class FrontPageViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func signInPressed(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter password/username" , preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error == nil {
                    let view = self.storyboard?.instantiateViewController(withIdentifier: "HomePage")
                    self.present(view!, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription , preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpPage")
        self.present(view, animated: true, completion: nil)
    }
}

