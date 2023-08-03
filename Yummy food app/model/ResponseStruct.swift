//
//  ResponseStruct.swift
//  Yummy food app
//
//  Created by Mohamed AbdElhakam on 02/08/2023.
//

import Foundation

struct WelcomeHome: Codable {
    let status: Int?
    let message: String?
    let data: AllDishes?
}

struct WelcomeDishes: Codable {
    let status: Int?
    let message: String?
    let data: [DishStruct]?
}

struct WelcomeOrders: Codable {
    let status: Int?
    let message: String?
    let data: [OrderStruct]?
}
