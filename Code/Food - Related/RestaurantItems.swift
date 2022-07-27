//
//  RestaurantItems.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import Foundation
import SwiftUI

struct RestaurantItem{
    
    let name:String
    let image:String
    let logo:String
    let stars:Float
    let distance:Float
    let noOfcoupons:Int
    let items:Array<FoodItem>
    
    init(name:String="McDonald's",image:String="mcdonald's",logo:String="mcdonald's_logo",stars:Float=4.8,distance:Float=5,noOfCoupons:Int=0,items:Array<FoodItem>=mcDonaldsItemsArray){
        self.name = name
        self.image = image
        self.logo = logo
        self.stars = stars
        self.distance = distance
        self.noOfcoupons = noOfCoupons
        self.items = items
    }
    
}

let mcdonaldsRestaurant = RestaurantItem()
let kfcRestaurant = RestaurantItem(name: "KFC", image: "kfc", logo: "kfc_logo", stars: 4.5, distance: 3.5,noOfCoupons: 1, items: kfcItemsArray)
let steakhouseRestaurant = RestaurantItem(name: "Steak House", image: "steakhouse", logo: "steakhouse_logo", stars: 3.8, distance: 1.2, noOfCoupons: 3, items: steakhouseItemsArray)
let tsaosushiRestaurant = RestaurantItem(name: "T'sao", image: "tsao", logo: "tsao_logo", stars: 4.7, distance: 8.2, noOfCoupons: 0, items: tsaoItemsArray)
let oldCuisineRestaurant = RestaurantItem(name: "Old Cuisine", image: "oldcuisine", logo: "oldcuisine_logo", stars: 3.2, distance: 0.5, noOfCoupons: 2, items: oldcuisineItemsArray)
let ristoranteRestaurant = RestaurantItem(name: "Ristorante", image: "ristorante", logo: "ristorante-logo", stars: 4.9, distance: 2.3, noOfCoupons: 1, items: ristoranteItemsArray)


let restaurantsArray = [mcdonaldsRestaurant,kfcRestaurant,steakhouseRestaurant,tsaosushiRestaurant,oldCuisineRestaurant,ristoranteRestaurant]
