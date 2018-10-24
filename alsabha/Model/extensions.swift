//
//  File.swift
//  alsabha
//
//  Created by Mostafa AbdEl Fatah on 10/22/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
    var toInt:Int{
        if let text = self.text {
            return Int(text) ?? 0
        }
        return 0
    }
}

