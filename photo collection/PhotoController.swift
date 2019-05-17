//
//  PhotoController.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class PhotoController {
    var photos : [Photo] = []
    
    func create(imageData: Data, title: String) {
//        Add a "Create" method that initializes a new instance of `Photo` and appends it to the `photos` array.
        let photo = Photo(imageData: imageData, title: title)
      photos.append(photo)
    }
    
    func update(photo: Photo, with imageData: Data, title: String) {
//   Add an "Update" method that takes in `Photo`,`Data`, and `String` parameters.
 
        guard let index = photos.index(of: photo) else {return}
        photos[index].imageData = imageData
        photos[index].title = title

    }
}
