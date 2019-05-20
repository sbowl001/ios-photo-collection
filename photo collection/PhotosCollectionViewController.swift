//
//  PhotosCollectionViewController.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotosCell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }

 
   
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        
        let photo = self.photoController.photos[indexPath.row]
        cell.titleLabel.text = photo.title
        cell.photosView.image = UIImage(data: photo.imageData)
    
   
    
        return cell
    }

    
    
    func setTheme() {
        
        //          - Get the current `themePreference` from the `themeHelper`. Make sure that it has a value, or return out of the function.
        guard let themePreference = themeHelper.themePreference else {return}
//        - Based on the value, change the collection view's background color depending on whether the theme is dark or the other color you selected.
        if (themePreference == .dark ) {
            collectionView.backgroundColor = UIColor.darkGray
        } else if (themePreference == .light) {
            collectionView.backgroundColor = UIColor.lightGray
        }
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "cellToView") {
            
        guard let indexPaths =
            collectionView?.indexPathsForSelectedItems,
            let destinationVC = segue.destination as? PhotoDetailViewController,
        let indexPath = indexPaths.first else {return}
        
        let photo = photoController.photos[indexPath.item]
        destinationVC.photo = photo
        destinationVC.photoController = photoController
        destinationVC.themeHelper = themeHelper
        }

   // ****NOTE(*******
        // why do we have to use .first? how is this different for selectedROw? explain please
        
       
//            - The segue from the cell should pass the `themeHelper`, `photoController`, and the `photo`.
        
        if(segue.identifier == "addPhoto") {
            //        - The segue from the "Add" bar button item should pass the the `themeHelper` and the `photoController`.
            guard let destinationVC = segue.destination as? PhotoDetailViewController else {return}
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
            
        }
        else if (segue.identifier == "selectTheme") {
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else {return}
            destinationVC.themeHelper = themeHelper
            
        }

//        - The segue from the "Select Theme" bar button item should pass the `themeHelper`.
    }
    
 
   

}
