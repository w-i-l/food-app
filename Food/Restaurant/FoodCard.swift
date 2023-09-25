//
//  Restaurant.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct  FoodCard:View{
    
    let name:String
    let price:Float
    let image:String
    
    var body: some View{
        VStack{
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:135, height: 135)
                .cornerRadius(15)
            
            VStack {
                Text(name )
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Text(String(format: " $%.2f", price))
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
            }
            
        }
        .frame(width:140,height: 200)
    }
    
    init(name:String="BigMac",image:String="bigmac",price:Float=6.99){
        self.name = name
        self.price = price
        self.image = image
    }
}

//struct FoodCard_Preview:PreviewProvider{
//    static var previews: some View{
//        
//        Restaurant(items:kfcItemsArray)
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//        Restaurant()
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//    }
//}
