//
//  Restaurant.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

class RestaurantMockedData {
    
    static let shared = RestaurantMockedData()
    
    private init() {}
    
    let mcdonaldsRestaurant = RestaurantItem(
        name: "McDonald's",
        image: "mcdonald's",
        logo: "mcdonald's_logo",
        stars: 4.8,
        distance: 5,
        noOfcoupons: 0,
        items: FoodMockedData.shared.mcDonaldsItemsArray
    )

    let kfcRestaurant = RestaurantItem(
        name: "KFC",
        image: "kfc",
        logo: "kfc_logo",
        stars: 4.5,
        distance: 3.5,
        noOfcoupons: 1,
        items: FoodMockedData.shared.kfcItemsArray
    )

    let steakhouseRestaurant = RestaurantItem(
        name: "Steak House",
        image: "steakhouse",
        logo: "steakhouse_logo",
        stars: 3.8,
        distance: 1.2,
        noOfcoupons: 3,
        items: FoodMockedData.shared.steakhouseItemsArray
    )

    let tsaosushiRestaurant = RestaurantItem(
        name: "T'sao",
        image: "tsao",
        logo: "tsao_logo",
        stars: 4.7,
        distance: 8.2,
        noOfcoupons: 0,
        items: FoodMockedData.shared.tsaoItemsArray
    )

    let oldCuisineRestaurant = RestaurantItem(
        name: "Old Cuisine",
        image: "oldcuisine",
        logo: "oldcuisine_logo",
        stars: 3.2,
        distance: 0.5,
        noOfcoupons: 2,
        items: FoodMockedData.shared.oldcuisineItemsArray
    )

    let ristoranteRestaurant = RestaurantItem(
        name: "Ristorante",
        image: "ristorante",
        logo: "ristorante-logo",
        stars: 4.9,
        distance: 2.3,
        noOfcoupons: 1,
        items: FoodMockedData.shared.ristoranteItemsArray
    )

    var restaurantsArray: [RestaurantItem] {[
        mcdonaldsRestaurant,
        kfcRestaurant,
        steakhouseRestaurant,
        tsaosushiRestaurant,
        oldCuisineRestaurant,
        ristoranteRestaurant
    ]}

}
