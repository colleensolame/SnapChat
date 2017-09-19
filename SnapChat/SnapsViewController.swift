//
//  SnapsViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/18/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var collection: [String] = []
    
    @IBOutlet weak var snapsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snapsTableView.dataSource = self
        snapsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = collection[indexPath.row]
        
        return cell
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let alertController = UIAlertController(title: "Create New Collection", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        let confirmAction = UIAlertAction(title: "Create", style: .default) { (_) in
            self.collection.append((alertController.textFields?[0].text)!)
            self.snapsTableView.reloadData()
        }
        
        
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "New Collection"
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
}
