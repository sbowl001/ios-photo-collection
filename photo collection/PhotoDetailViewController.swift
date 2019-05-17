//
//  PhotoDetailViewController.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

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
        if (themePreference == "Dark" ) {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .lightGray
        }
    }
    
    func updateViews(){
        setTheme()
        guard let photo = photo else {return}
        
       chooseImageView.image = UIImage(data: photo.imageData)
        newTitleLabel.text = photo.title
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
//         4. The `addImage` action should present a `UIImagePickerController` that allows the user to select an image to add to the `Photo` object.
    }
    
    @IBAction func savePhoto(_ sender: Any) {
//        3. The "Save" bar button item's action should either update the `photo` if it has a value, or create a new instance of `photo` using the methods in the `photoController`. "Pop" the view controller afterwards.
    }
   
   
//    - **Note:** Make sure you request authorization to access the photo library, and add the "Privacy - Photo Library Usage Description" key-value pair in the info.plist.
//    - **Note:** You will need to adopt the `UIImagePickerControllerDelegate` and implement the `didFinishPickingMediaWithInfo` method to get the image the user selects, then dismiss the image picker. You will also need to adopt the `UINavigationControllerDelegate`.
    


}
