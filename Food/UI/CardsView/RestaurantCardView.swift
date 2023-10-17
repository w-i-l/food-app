//
//  RestaurantCardView.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct RestaurantCardView: View {
    
    let image: String
    let logo: String
    
    var body: some View {
        ZStack {
            
            Image(image)
                .resizable()
                .frame(width: 150, height: 100)
                .aspectRatio(contentMode: .fit)
                .overlay(Color.gray.opacity(0.7))
                .cornerRadius(20)
            
            Text(image.uppercased())
                .font(.custom("Inter-ExtraBold",size: 16))
                .foregroundColor(.white)
            
            ZStack {
                
                Circle()
                    .fill(backgroundWhite)
                    .frame(width: 49,height: 49)
                
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 49, height: 49)
                    .cornerRadius(20)
                    .clipShape(Circle())
                
            }
            .overlay(
                Circle()
                    .strokeBorder(Color.gray)
                )
            .offset(y:40)
            
        }
        .frame(width: 150, height: 130)
    }
    
    init (
        image: String = "kfc",
        logo: String = "kfc_logo"
    ){
        self.image = image
        self.logo = logo
    }
}


struct RestaurantCard_Preview:PreviewProvider{
    static var previews: some View{
        RestaurantCardView()
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }
}
