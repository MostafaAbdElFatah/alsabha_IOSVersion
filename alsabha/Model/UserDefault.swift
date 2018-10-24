//
//  UserDefault.swift
//  alsabha
//
//  Created by Mostafa AbdEl Fatah on 10/10/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import Foundation

class UserDefault{
    let setting:UserDefaults?
    init() {
        self.setting = UserDefaults.standard
    }
    
    ///
    
    func getVibrator() -> Bool {
        let vibrator = self.setting?.object(forKey: "vibrator") as? Bool ?? true
        return vibrator
    }
    
    func saveVibratorSetting(vibrator:Bool) {
        self.setting?.set(vibrator, forKey: "vibrator")
        self.setting?.synchronize()
    }
    ////
    func getSound() -> Bool {
        let sound = self.setting?.object(forKey: "sound") as? Bool ?? true
        return sound
    }
    
    func saveSoundSetting(sound:Bool) {
        self.setting?.set(sound, forKey: "sound")
        self.setting?.synchronize()
    }
    
    ///
    func saveSelectedText(index:Int) {
        self.setting?.set(index, forKey: "selectedIndex")
        self.setting?.synchronize()
    }
    
    func getSelectedIndex() -> Int {
        let index = self.setting?.object(forKey: "selectedIndex") as? Int ?? 0
        return index
    }
   
    ///
    func saveTextCount(text:String, count:Int) {
        self.setting?.set(count, forKey: text)
        self.setting?.synchronize()
    }
    
    func getTextCount(text:String) -> Int {
        let count = self.setting?.object(forKey: text ) as? Int ?? 0
        return count
    }
    
    
}












