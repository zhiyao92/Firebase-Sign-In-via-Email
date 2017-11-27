//
//  HomeViewController.swift
//  Firebase
//
//  Created by Kelvin on 11/27/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
     let user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            statusLabel.text = "You are logged in with email: \(user.email!)"
        }
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        if user != nil {
            do {
                try Auth.auth().signOut()
                let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage")
                present(view, animated: true, completion: nil)
            } catch let error as NSError {
                
            }
        }
    }
}
