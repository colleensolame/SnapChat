//
//  SignInViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/18/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnTurnUp(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            print("We want to sign in")
            if error != nil {
                print("Hey, we have an error: \(String(describing: error))")
            } else {
                print("Signed in successfully"
                )
            }
        }
        
    }
    
    
}

