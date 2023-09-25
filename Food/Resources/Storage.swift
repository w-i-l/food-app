//
//  Storage.swift
//  Food
//
//  Created by mishu on 07.09.2022.
//

import SwiftUI

class Storage:ObservableObject{
    @Published var itemsInCart:[FoodItem:Int] = [:]
}
