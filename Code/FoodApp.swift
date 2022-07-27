//
//  FoodApp.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

@main
struct FoodApp: App {
    @State public var itemsInCart:[FoodItem:Int]=[:] // storage
    var body: some Scene {
        WindowGroup {
            APP(itemsInCart: $itemsInCart)
//            Search()
//            ContentVie()        }
        }
    }
}
