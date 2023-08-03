//
//  uiViewController+Extention.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 31/07/2023.
//

import UIKit

extension UIViewController{
    
   static var identifier : String {
        
       return String(describing: self)
        
    }
    static func instantiat() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(identifier: identifier) as! Self
    }
    
}
