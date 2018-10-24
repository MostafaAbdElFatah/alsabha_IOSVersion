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
    @IBOutlet weak var soundSwitch: UISwitch!{
        didSet{
            soundSwitch.isOn = userDefault.getSound()
        }
    }
    @IBOutlet weak var vibratorSwitch: UISwitch!{
        didSet{
            vibratorSwitch.isOn = userDefault.getVibrator()
        }
    }
    
    @IBAction func viewTabed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil )
    }
   
    
    @IBAction func soundValueChanged(_ sender: UISwitch) {
        userDefault.saveSoundSetting(sound: sender.isOn)
    }
    
    
    @IBAction func vibratorValueChanged(_ sender: UISwitch) {
        userDefault.saveVibratorSetting(vibrator: sender.isOn)
    }
    
}
