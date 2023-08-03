//
//  order.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import Foundation

struct OrderStruct : Codable {
    let id : String?
    let name : String?
    let dish : DishStruct?
}
