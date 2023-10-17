//
//  RestaurantAPI.shared.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

class RestaurantAPI {
    
    static let shared = RestaurantAPI()
    
    private init() {}
    
    func getAllRestaurants() -> [RestaurantItem] {
        return RestaurantMockedData.shared.restaurantsArray
    }
}
