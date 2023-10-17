//
//  SearchViewModel.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchedText: String = ""
    
    var searchArray: [FoodItem] {
        
        if self.searchedText.isEmpty{
            return FoodAPI.shared.getAllFood()
        } else if FoodAPI.shared.getAllFood().filter({$0.name.lowercased().starts(with: self.searchedText.lowercased())}).count == 0 {
            return []
        } else{
            return FoodAPI.shared.getAllFood().filter{$0.name.lowercased().starts(with: self.searchedText.lowercased())}
        }
    }
    
}
