//
//  CategoryModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import SwiftUI

enum Category: String{
    
    case burger = "burger"
    case salad = "salad"
    case sushi = "sushi"
    case chicken = "chicken"
    case beef = "beef"
    case pizza = "pizza"
    case pasta = "pasta"
    case desserts = "desserts"
}


struct CategoryItem{
    
    let name: String
    let image: String
    let category: Category
    let color: Color
}
