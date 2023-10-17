//
//  FoodAPI.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

class FoodAPI {
    
    static let shared = FoodAPI()
    
    private init() {}
    
    func getAllFood() -> [FoodItem] {
        return FoodMockedData.shared.allFood
    }
    
    func getFoodFrom(category: Category) -> [FoodItem] {
        return FoodMockedData.shared.allFood.filter { $0.category == category }
    }
    
}
