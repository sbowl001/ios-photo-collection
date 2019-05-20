//
//  PhotoDetailViewController.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit
import Photos


class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var chooseImageView: UIImageView!
    
    @IBOutlet weak var newTitleLabel: UITextField!
    
    
    var photoController : PhotoController?
    
    var photo: Photo?
    
    var themeHelper : ThemeHelper?
    

    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        if (themePreference == .dark) {
            view.backgroundColor = .darkGray
        } else if (themePreference == .light) {
            view.backgroundColor = .lightGray
        }
    }
    
    private func updateViews(){
        setTheme()
        guard let photo = photo else {return}
        
       chooseImageView.image = UIImage(data: photo.imageData)
        newTitleLabel.text = photo.title
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let title = newTitleLabel.text,
            let image = chooseImageView.image,
            let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: imageData, title: title    )
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addPhoto(_ sender: Any) {
        present(UIImagePickerController(), animated: true, completion: nil)
        
        let preservedStatus = PHPhotoLibrary.authorizationStatus()
        switch preservedStatus {
        case .authorized:
            self.presentImagePickerController()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if newStatus == .authorized {
                    self.presentImagePickerController()
                } else {
                    return
                }
            })
        default:
            return
        }
    }
    
    func presentImagePickerController(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            return
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)


        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        chooseImageView.image = image

    }
  
}
