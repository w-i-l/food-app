//
//  RestaurantView.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct FoodCardView: View {
    
    let name: String
    let price: Float
    let image: String
    
    var body: some View {
        VStack {
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 135, height: 135)
                .cornerRadius(15)
            
            VStack {
                
                Text(name)
                    .foregroundColor(.gray)
                    .font(.inter(.regular, size: 16))
                
                Text(String(format: " $%.2f", price))
                    .foregroundColor(.black)
                    .font(.inter(.medium, size: 16))
            }
        }
        .frame(width: 140,height: 200)
    }
    
    init(
        name: String = "BigMac",
         image: String = "bigmac",
         price: Float = 6.99
    ){
        self.name = name
        self.price = price
        self.image = image
    }
}

struct FoodCard_Preview:PreviewProvider{
    static var previews: some View{
        
        RestaurantView(items: FoodMockedData.shared.mcDonaldsItemsArray)
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }
}
