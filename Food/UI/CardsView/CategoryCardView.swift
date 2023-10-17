//
//  CategoryCardView.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct CategoryCardView: View {
    
    let image: String
    let text: String
    let width: CGFloat
    let height: CGFloat
    let color: Color
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: width, height: height)
            
            VStack {
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height / 3)
                    .padding(.top, 15)
                
                Text(text)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
            }
        }
        .frame(width: width, height: height)
    }
    
    init(text: String = "Burger",
         image: String = "burger",
         width: CGFloat = 100,
         height: CGFloat = 100,
         color: Color = Color(red: 0.92, green: 0.70, blue: 0.43).opacity(0.9)) {
        self.image = image
        self.text = text
        self.width = width
        self.height = height
        self.color = color
    }

}

struct CatehoryCard_Preview:PreviewProvider{
    static var previews: some View{
        CategoryCardView()
        
    }
}
