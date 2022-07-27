//
//  ItemCard.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

struct ItemCard:View{
    
    let name:String
    let image:String
    let price:Float
    public let quantity:Int
    
    var body:some View{
        
        HStack(spacing:20){
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:80)
            
            VStack{
                
                Text(name)
                    .foregroundColor(blackJetColor)
                    .font(.system(size:20))
                    .fontWeight(.medium)
//                    .frame(width:100,height:20)
                
                Text(String.init(format: "$%.2f", price))
                    .foregroundColor(blackJetColor)
                    .font(.system(size:20))
                    .fontWeight(.light)
                
            }
            
            
        }
        
    }
    
    init(name:String="BigMac Menu",image:String="bigmac",price:Float=15.99,quantity:Int=1){
        self.name = name
        self.image = image
        self.price = price
        self.quantity = quantity
        
    }
}

struct ItemCard_preview:PreviewProvider{
    static var previews:some View{
        ZStack {
            backgroundWhite.ignoresSafeArea()
            ItemCard()
                .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
        }
    }
}
