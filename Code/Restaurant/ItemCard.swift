//
//  ItemCard.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct ItemCard:View{
    
    let name:String
    
    var body: some View{
        ZStack{
            
            Image("\(name.lowercased())")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:135, height: 135)
                .cornerRadius(15)
        }
    }
    
    init(name:String="BigMac"){
        self.name = name
    }
    
    
}

struct ItemCard_Preview:PreviewProvider{
    static var previews: some View{
        ItemCard()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
        
    }
}
