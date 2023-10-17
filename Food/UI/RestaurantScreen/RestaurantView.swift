//
//  RestaurantView.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct RestaurantView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingRestaurant: Bool = false
    
    let noOfCoupons: Int
    let name: String
    let logo: String
    let stars: Float
    let distance: Float
    let items: Array<FoodItem>
    
    var body: some View {
        
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                
                //top bar
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 20)
                        .padding()
                        .onTapGesture{dismiss()}
                    
                    Spacer()
                    
                    Text("\(noOfCoupons)")
                        .foregroundColor(blackJetColor)
                        .font(.inter(.semiBold, size: 20))
                        .padding(.trailing, 0)
                    
                    Image(systemName: "giftcard.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 30)
                        .padding(.trailing)
                }
                
                ScrollView(showsIndicators: false) {
                    
                    //name
                    HStack{
                        
                        Text("\(name)")
                            .foregroundColor(blackJetColor)
                            .font(.inter(.bold, size: 28))
                            .bold()
                            
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(grayColor)
                                .frame(width: 38, height: 38)
                            
                            Image(logo)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode:.fit)
                                .foregroundColor(blackJetColor)
                                .frame(width: 38)
                            }
                  
                        }
                    
                    //distance
                    HStack{
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width: 20)
                        
                        Text(String(format: "%.1f", stars))
                            .foregroundColor(.gray)
                            .font(.inter(.semiBold, size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width: 20)
                        
                        Text(String(format: "%.0f", distance)+"km")
                            .foregroundColor(.gray)
                            .font(.inter(.semiBold, size: 16))

                        
                    }
                    .padding(.horizontal, 80)
                    
                    //menu label
                    HStack {
                        Text("Menu")
                            .foregroundColor(blackJetColor)
                            .font(.inter(.regular, size: 20))
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    
                    // displaying food 
                    VStack{
                       
                        ForEach(Array(stride(from: 0, to: items.count, by: 2)),id: \.self) { no in
                        
                                    let item = items[no]
                                    
                                    HStack(spacing:10){
                                        NavigationLink(destination: Item(
                                            itemType: item.category,
                                            name: item.name,
                                            image:item.image,
                                            price: item.price,
                                            text: item.description
                                        ).navigationBarHidden(true)) {
                                            FoodCardView(
                                                name: item.name,
                                                image:item.image,
                                                price: item.price
                                            )
                                            .padding(.horizontal)
                                        }
                                        
                                        if no+1 < items.count {
                                            
                                            let item2 = items[no+1]
                                            
                                            NavigationLink(destination: Item(
                                                itemType: item2.category,
                                                name: item2.name,
                                                image:item2.image,
                                                price: item2.price,
                                                text: item2.description
                                            ).navigationBarHidden(true)) {
                                                FoodCardView(
                                                    name: item2.name,
                                                    image:item2.image,
                                                    price: item2.price
                                                )
                                                .padding(.horizontal)
                                            }
                                        }
                                    }
                                    .padding(.bottom,30)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    init(name: String = "McDonald's",
         logo: String = "mcdonald's_logo",
         stars: Float = 4.8,
         distance: Float = 5,
         noOfCoupons: Int = 0,
         items: Array<FoodItem> = FoodMockedData.shared.allFood
    ){
        self.noOfCoupons = noOfCoupons
        self.name = name
        self.logo = logo
        self.stars = stars
        self.distance = distance
        self.items = items
    }

}

struct Restaurant_Preview:PreviewProvider{
    @State var iss=false
    static var previews: some View{
        RestaurantView(items: FoodMockedData.shared.kfcItemsArray)
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }
}
