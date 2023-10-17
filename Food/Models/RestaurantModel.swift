//
//  RestaurantModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

struct RestaurantItem {
    
    let name: String
    let image: String
    let logo: String
    let stars: Float
    let distance: Float
    let noOfcoupons: Int
    let items: Array<FoodItem>
}
