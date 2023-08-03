//
//  categoryDishes.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import Foundation

struct DishCategoryStruct : Codable {
    let id, name, image : String?
    
    enum CodingKeys: String, CodingKey{
        case id, image
        case name = "title"
        
    }
}
