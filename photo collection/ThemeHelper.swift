//
//  ThemeHelper.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    init(){
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: .themePreferenceKey)
        
    }
    
    var themePreference : String? {
        let userDefaults = UserDefaults.standard
        userDefaults.string(forKey: .themePreferenceKey)
        return String
    }
/*@IBAction func plutoSwitchToggled(_ sender: UISwitch) {
 let userDefaults = UserDefaults.standard
 userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
 }*/
}

extension String {
    static var themePreferenceKey = "themePreferenceKey"

}

