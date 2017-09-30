//
//  PictureViewController.swift
//  SnapChat
//
//  Created by Colleen Ng on 9/19/17.
//  Copyright © 2017 ZND Code. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var snapImageView: UIImageView!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        snapImageView.image = image
        
        snapImageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnCamera(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
        imagePicker.allowsEditing = false
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imagesFolder = Storage.storage().reference().child("images")
        let imageData = UIImageJPEGRepresentation(snapImageView.image!, 0.1)!
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil, completion: {(metadata, error) in
            
            print("We tried to upload!")
            
            if error != nil {
                
                print("We had an error: \(String(describing: error))")
                
            } else {
                
                print(metadata?.downloadURL() as Any)
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: metadata?.downloadURL()!.absoluteString)
                self.nextButton.isEnabled = true
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SelectUserViewController
        nextVC.imageURL = sender as! String
        nextVC.descript = txtDescription.text!
        
            }

    
    
    
    
    
    
    
    
    
}
