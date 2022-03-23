//
//  ViewController.swift
//  SeaFood
//
//  Created by JUNSOO PARK on 2022-03-22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        if TARGET_IPHONE_SIMULATOR != 0 {
            imagePicker.sourceType = .photoLibrary
        } else {
            imagePicker.sourceType = .camera
        }
        
        imagePicker.allowsEditing = false
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

