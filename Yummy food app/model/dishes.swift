//
//  dishes.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 30/07/2023.
//

import Foundation


struct DishStruct : Codable {
    
    
    let id , name , description , image : String?
    let calories : Int?
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
