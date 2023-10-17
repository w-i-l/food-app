//
//  RestaurantCard.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct RestaurantCard:View{
    let  image:String
    let logo:String
    
//    @Binding var isShowingNavBar:Bool
    

//    let restaurent:Restaurant
    
    var body: some View{
        ZStack{
            
//            RoundedRectangle(cornerRadius: 20)
//                .fill(grayColor)
//                .frame(width: 150, height: 100)
            Image(image)
                .resizable()
                                .frame(width: 150, height: 100)
                                .aspectRatio(contentMode: .fit)
//                .cornerRadius(20)
                .overlay(Color.gray.opacity(0.7))
                .cornerRadius(20)
            
            Text(image.uppercased())
                .font(.custom("Inter-ExtraBold",size: image.count > 5 ? 20 : 32))
                .foregroundColor(.white)
                
            ZStack {
                
                Circle()
                    .fill(backgroundWhite)
                    .frame(width:49,height: 49)
                
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 49, height: 49)
                    .cornerRadius(20)
                    .clipShape(Circle())
                
            }
            .offset(y:40)
//            Circle()
//                .fill(.gray)
//                .frame(width: 49)
//                .offset(y:40)
                
        }
//        .cornerRadius(20)
        .frame(width: 150, height: 130)
//        .onTapGesture {
//            self.isShowingNavBar.toggle()
//        }
       
        
    }
    
    init(image:String="kfc",logo:String="kfc_logo"){
        self.image=image
        self.logo=logo
//        self.restaurent = restaurant
//        self._isShowingNavBar = isShowingNavBar
        
        
    }
}

let a = RestaurantCard()

struct RestaurantCard_Preview:PreviewProvider{
    static var previews: some View{
            a
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }
}
