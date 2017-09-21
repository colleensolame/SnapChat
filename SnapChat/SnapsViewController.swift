//
//  SnapsViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/18/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var snaps: [Snap] = []
    
    @IBOutlet weak var snapsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snapsTableView.dataSource = self
        snapsTableView.delegate = self
        
        Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("snaps").observe(DataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            let snap = Snap()
            let snapshotValue = snapshot.value as? NSDictionary
            snap.imageURL = snapshotValue!["imageURL"] as! String
            snap.from = snapshotValue!["from"] as! String
            snap.descript = snapshotValue!["description"] as! String
            
            self.snaps.append(snap)
            self.snapsTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from
        
        return cell
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewSnapSegue" {
            let nextVC = segue.destination as! ViewSnapViewController
            nextVC.snap = sender as! Snap
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap = snaps[indexPath.row]
        
        performSegue(withIdentifier: "viewSnapSegue", sender: snap)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
