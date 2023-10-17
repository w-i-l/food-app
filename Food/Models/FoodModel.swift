//
//  FoodModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

struct FoodItem {
    
    let name: String
    let menuName: String
    let image: String
    let price: Float
    let menuPrice: Float
    let description: String
    let menuItemsKeys: Array<String>
    let menuItemsValues: Array<Array<String>>
    let category: Category
}

extension FoodItem: Identifiable {
    var id: String {
        return name + menuName + image + description
    }
}

extension FoodItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
