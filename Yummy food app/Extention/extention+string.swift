//
//  extention+string.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import Foundation

extension String {
    var asUrl : URL? {
        return URL(string : self)
    }
}
