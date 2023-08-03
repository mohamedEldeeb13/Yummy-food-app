//
//  uiViewExtention.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 29/07/2023.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius : CGFloat {
        get {return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
}
