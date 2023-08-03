//
//  AllDishes.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import Foundation

 
struct AllDishes : Codable {
    let categories: [DishCategoryStruct]?
    let populars: [DishStruct]?
    let specials: [DishStruct]?
}

