//
//  PhotosCollectionViewCell.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photosView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        photosView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
    
   

}
