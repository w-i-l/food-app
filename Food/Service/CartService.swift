//
//  CartService.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Combine

class CartService {
    static let shared = CartService()
    
    private init() {}
    
    private(set) var cartItems: CurrentValueSubject<[CartItemModel: Int], Never> = .init([:])
    
    func addItem(item: CartItemModel, quantity: Int) {
        self.cartItems.value[item] = quantity
    }
    
    func removeItem(item: CartItemModel) {
        self.cartItems.value[item] = nil
    }
    
    func increaseQuantity(item: CartItemModel) {
        self.cartItems.value[item]! += 1
    }
    
    func decreaseQuantity(item: CartItemModel) {
        guard self.cartItems.value[item] != nil else { return }
        if self.cartItems.value[item]! == 1 {
            self.cartItems.value[item] = nil
        } else {
            self.cartItems.value[item]! -= 1
        }
    }
}
