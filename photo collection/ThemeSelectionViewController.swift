//
//  ThemeSelectionViewController.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    var themeHelper: ThemeHelper?
    
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
   


}
