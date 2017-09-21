//
//  ViewSnapViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/21/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblDes: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblDes.text = snap.descript
    }

    
}
