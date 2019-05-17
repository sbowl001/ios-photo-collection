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
        } else if (themePreference == "Light") {
            view.backgroundColor = .blue
        }
    }
    
    private func updateViews(){
        setTheme()
        guard let photo = photo else {return}
        
       chooseImageView.image = UIImage(data: photo.imageData)
        newTitleLabel.text = photo.title
        
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        present(UIImagePickerController(), animated: true, completion: nil)
//        present(UIImagePickerControllerDelegate(self))
//         4. The `addImage` action codershould present a `UIImagePickerController` that allows the user to select an image to add to the `Photo` object.
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
   
   
//    - **Note:** Make sure you request authorization to access the photo library, and add the "Privacy - Photo Library Usage Description" key-value pair in the info.plist.
//    - **Note:** You will need to adopt the `UIImagePickerControllerDelegate` and implement the `didFinishPickingMediaWithInfo` method to get the image the user selects, then dismiss the image picker. You will also need to adopt the `UINavigationControllerDelegate`.
    


}
