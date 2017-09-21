//
//  SelectUserViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/19/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users: [User] = []
    var imageURL = ""
    var descript = ""

    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.dataSource = self
        userTableView.delegate = self
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: { (snapshot) in
            let user = User()
            let snapshotValue = snapshot.value as? NSDictionary
            user.email = snapshotValue!["email"] as! String
            user.uid = snapshot.key
            
            self.users.append(user)
            self.userTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        // Create dictionary for user info
        let snap = ["from": user.email, "description": descript, "imageURL": imageURL]
        
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue(snap)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    

}
