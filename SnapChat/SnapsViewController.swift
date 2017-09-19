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
        
    }
    
}
