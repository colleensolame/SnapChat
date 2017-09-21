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
import FirebaseDatabase

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
                
                Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPassword.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We now have an error")
                    } else {
                        print("Created user successfully")
                        Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                        
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                })
            } else {
                print("Signed in successfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
                
            }
        }
    }
    
    
    
}

