//
//  CategoriesMockedData.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation
import SwiftUI

class CategoriesMockedData {
    
    static let shared = CategoriesMockedData()
    let categoryArray: [CategoryItem]
    
    private init() {
        
        self.categoryArray = [
            burgerCategory,
            chickenCategory,
            beefCategory,
            sushiCategory,
            saladCategory,
            pizzaCategory,
            pastaCategory,
            dessertsCategory
        ]
    }
    
    let burgerCategory = CategoryItem(name: "Burger",
                                      image: "burger",
                                      category: .burger,
                                      color: Color(red: 0.92, green: 0.70, blue: 0.43).opacity(0.9))

    let chickenCategory = CategoryItem(name: "Chicken",
                                       image: "chicken",
                                       category: .chicken,
                                       color: Color(red: 0.51, green: 0.45, blue: 0.59))

    let beefCategory = CategoryItem(name: "Beef",
                                    image: "beef",
                                    category: .beef,
                                    color: Color(red: 0.29, green: 0.44, blue: 0.61))

    let sushiCategory = CategoryItem(name: "Sushi",
                                     image: "sushi",
                                     category: .sushi,
                                     color: Color(red: 0.75, green: 0.55, blue: 0.39))

    let saladCategory = CategoryItem(name: "Salad",
                                     image: "salad",
                                     category: .salad,
                                     color: Color(red: 0.70, green: 0.73, blue: 0.34))

    let pizzaCategory = CategoryItem(name: "Pizza",
                                     image: "pizza",
                                     category: .pizza,
                                     color: Color(red: 1.00, green: 0.52, blue: 0.70))

    let pastaCategory = CategoryItem(name: "Pasta",
                                     image: "pasta",
                                     category: .pasta,
                                     color: Color(red: 0.56, green: 0.74, blue: 0.83))

    let dessertsCategory = CategoryItem(name: "Desserts",
                                        image: "desserts",
                                        category: .desserts,
                                        color: Color(red: 0.02, green: 0.35, blue: 0.36))
}
