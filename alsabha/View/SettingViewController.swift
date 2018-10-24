//
//  SettingViewController.swift
//  alsabha
//
//  Created by Mostafa AbdEl Fatah on 10/22/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    let userDefault:UserDefault = UserDefault()

    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var soundImage: UIImageView!{
        didSet{
            if userDefault.getSound() {
                soundImage.image = #imageLiteral(resourceName: "checkBox")
            }else{
                soundImage.image = #imageLiteral(resourceName: "emptyCheckBox")
            }
        }
    }
    @IBOutlet weak var vibratorImage: UIImageView!{
        didSet{
            if userDefault.getVibrator() {
                soundImage.image = #imageLiteral(resourceName: "checkBox")
            }else{
                soundImage.image = #imageLiteral(resourceName: "emptyCheckBox")
            }
        }
    }
    
    @IBAction func viewTabed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil )
    }
    
    @IBAction func soundTabed(_ sender: Any) {
        if soundImage.image == #imageLiteral(resourceName: "emptyCheckBox") {
            soundImage.image = #imageLiteral(resourceName: "checkBox")
            userDefault.saveSoundSetting(sound: true)
        }else{
            soundImage.image = #imageLiteral(resourceName: "emptyCheckBox")
            userDefault.saveSoundSetting(sound: false)
        }
        soundImage.setNeedsDisplay()
    }
    
    @IBAction func vibratorTabed(_ sender: Any) {
        if vibratorImage.image == #imageLiteral(resourceName: "emptyCheckBox") {
            vibratorImage.image = #imageLiteral(resourceName: "checkBox")
            userDefault.saveVibratorSetting(vibrator: true)
        }else{
            vibratorImage.image = #imageLiteral(resourceName: "emptyCheckBox")
            userDefault.saveVibratorSetting(vibrator: false)
        }
        vibratorImage.setNeedsDisplay()
    }
    
}
