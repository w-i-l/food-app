//
//  CategoryItems.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

enum Category:String{
    
    case burger="burger"
    case salad="salad"
    case sushi="sushi"
    case chicken="chicken"
    case beef="beef"
    case pizza="pizza"
    case pasta="pasta"
    case desertes="desertes"
}


struct CategoryItem{
    
    let name:String
    let image:String
    let category:Category
    let color:Color
    
    init(name:String="Burger",image:String="burger",category:Category = .burger, color:Color = Color.init(red: 0.92, green: 0.70, blue: 0.43).opacity(0.9)){
        self.name = name
        self.image = image
        self.category = category
        self.color = color
    }
}

let burgerCategory = CategoryItem()
let chickenCategory = CategoryItem(name: "Chicken", image: "chicken", category: .chicken,color:Color.init(red: 0.51, green: 0.45, blue: 0.59))
let beefCategory = CategoryItem(name: "Beef", image: "beef", category: .beef, color: Color(red: 0.29, green: 0.44, blue: 0.61))
let sushiCategory = CategoryItem(name: "Sushi", image: "sushi", category: .sushi, color: Color(red: 0.75, green: 0.55, blue: 0.39))
let saladCategory = CategoryItem(name: "Salad", image: "salad", category: .salad, color: Color.init(red: 0.70, green: 0.73, blue: 0.34))
let pizzaCategory = CategoryItem(name: "Pizza", image: "pizza", category: .pizza, color: Color.init(red: 1.00, green: 0.52, blue: 0.70))
let pastaCategory = CategoryItem(name: "Pasta", image: "pasta", category: .pasta, color: Color.init(red: 0.56, green: 0.74, blue: 0.83))
let desertesCategory = CategoryItem(name: "Desertes", image: "desertes", category: .desertes, color: Color.init(red: 0.02, green: 0.35, blue: 0.36))

let categoryArray = [burgerCategory,chickenCategory,beefCategory,sushiCategory,saladCategory,pizzaCategory,pastaCategory,desertesCategory]

