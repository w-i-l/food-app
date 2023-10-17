//
//  CartViewModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItemModel: Int] = [:]
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        CartService.shared.cartItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                print(value)
                self?.cartItems = value
            }
            .store(in: &self.bag)
    }
}
