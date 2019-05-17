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

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var chooseImageView: UIImageView!
    
    @IBOutlet weak var newTitleLabel: UITextField!
    
    
    var photoController : PhotoController?
    
    var photo: Photo?
    
    var themeHelper : ThemeHelper?
    
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    @IBAction func savePhoto(_ sender: Any) {
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
