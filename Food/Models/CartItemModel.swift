//
//  CartItemModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

struct CartItemModel {
    let item: FoodItem
    let selectedOptions: [String]
}

extension CartItemModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.item.id)
    }
}
