//
//  ViewController.swift
//  alsabha
//
//  Created by Mostafa AbdEl Fatah on 10/10/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var textIndex = 0
    var audio:AVAudioPlayer?
    var settingInfo:UserDefault!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var clickedView: UIView!
    @IBOutlet var tabedGestyreRecognize: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingInfo = UserDefault()
        textlabel.addGestureRecognizer(tabedGestyreRecognize)
        clickedView.addGestureRecognizer(tabedGestyreRecognize)
        let path = Bundle.main.path(forResource: "media/sound.mp3", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        do{
            audio = try AVAudioPlayer(contentsOf: url)
        }catch {
            print("some error occur in playing audio")
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.textIndex = settingInfo.getSelectedIndex()
        self.updateViewsSetting()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.saveSetting()
    }
    
    @IBAction func viewTabed(_ sender: Any) {
        
        var counter:Int = counterLabel.toInt
        counter = counter + 1
        counterLabel.text = String(counter)
        if self.settingInfo.getSound() {
            audio?.play()
        }
        if self.settingInfo.getVibrator() {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }

    @IBAction func setting_btnClicked(_ sender: UIButton) {
        
        if (self.settingInfo.getSound()) {
            audio?.play()
        }
        if (self.settingInfo.getVibrator()) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        
        UIView.transition(
            with: sender
            , duration: 0.5
            , options: [.transitionFlipFromLeft]
            , animations: nil
            , completion: nil
        )
        
    
    }
    @IBAction func reset_btnClicked(_ sender: UIButton) {
        
        if self.settingInfo.getSound() {
            audio?.play()
        }
        if self.settingInfo.getVibrator() {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        
        UIView.transition(
            with: sender
            , duration: 0.5
            , options: [.transitionFlipFromLeft]
            , animations: nil
            , completion: nil
        )
        counterLabel.text = "0"
        self.saveSetting()
    }
    
    @IBAction func menu_btnClicked(_ sender: UIButton) {
        
        if self.settingInfo.getSound() {
            audio?.play()
        }
        if self.settingInfo.getVibrator() {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        
        UIView.transition(
            with: sender
            , duration: 0.5
            , options: [.transitionFlipFromLeft]
            , animations: nil
            , completion: nil
        )

    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.saveSetting()
        if let destination = segue.destination as? MenuViewController {
            destination.delegate = self
        }
        
    }
    
    func saveSetting()  {
        settingInfo.saveSelectedText(index: self.textIndex )
        settingInfo.saveTextCount(text: "text\(self.textIndex)", count: counterLabel.toInt)
    }
    
    func updateViewsSetting()  {
        self.textlabel.text = Constants.textsLists[self.textIndex]
        let num = settingInfo.getTextCount(text: "text\(self.textIndex)")
        let countString = "\(num)"
        self.counterLabel.text = countString
    }
   
}

extension ViewController:MenuViewControllerDelegate{
    func setTextToLabel(index:Int) {
        self.textIndex = index
        self.updateViewsSetting()
    }
}


protocol MenuViewControllerDelegate {
    func setTextToLabel(index:Int)
}










