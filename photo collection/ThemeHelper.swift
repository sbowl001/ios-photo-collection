//
//  ThemeHelper.swift
//  photo collection
//
//  Created by Stephanie Bowles on 5/17/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

class ThemeHelper {
    
    var themePreferenceKey : String = "ThemePreference"
    
    init(){
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(String.dark, forKey: themePreferenceKey)
    }
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(String.light, forKey: themePreferenceKey)
        
    }
    
    var themePreference : String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}

extension String {
    static var dark = "Dark"
    static var light = "Light"
}

