//
//  Restaurant.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct  Restaurant:View{
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storage:Storage
    
    let noOfCoupons:Int
    let name:String
    let logo:String
    let stars:Float
    let distance:Float
    let items:Array<FoodItem>
    
    @State var isShowingRestaurant:Bool = false
    
    var body: some View{
        
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                
                //top bar
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width:30)
                        .padding()
                        .onTapGesture{dismiss()}
                    
                    Spacer()
                    
                    Text("\(noOfCoupons)")
                        .foregroundColor(blackJetColor)
                        .font(.custom("Inter-SemiBold",size:20))
                        .padding(.trailing,0)
                    
                    Image(systemName: "giftcard.fill")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width:30)
                        .padding(.trailing)
                    
                }
                
                ScrollView{
                    //name
                    HStack{
                        
                        Text("\(name)")
                            .foregroundColor(blackJetColor)
    //                        .font(.custom("Inter-Bold",size:32))
                            .font(.system(size: 36))
                            .bold()
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(grayColor)
                                .frame(width: 38, height: 38)
                            Image(logo)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .foregroundColor(blackJetColor)
                                .frame(width:38)
                            }
                  
                        }
                    
                    //distance
                    HStack{
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width:24)
                        
                        Text(String(format: "%.1f", stars))
                            .foregroundColor(blackJetColor)
    //                        .font(.custom("Inter-Bold",size:32))
                            .font(.system(size: 20))
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width:24)
                        
                        Text(String(format: "%.0f", distance)+"km")
                            .foregroundColor(blackJetColor)
    //                        .font(.custom("Inter-Bold",size:32))
                            .font(.system(size: 20))
                            .fontWeight(.light)

                        
                    }
                    .padding([.trailing,.leading],70)
                    
                    //menu label
                    HStack {
                        Text("Menu")
                            .foregroundColor(blackJetColor)
                            .font(.system(size: 24))
                            .fontWeight(.regular)
                            .padding(30)
    //                        .padding(.leading)
                        
                        Spacer()
                    }
                    
                    // displaying food 
                    VStack{
                       
                        ForEach(Array(stride(from: 0, to: items.count, by: 2)),id:\.self){no in
                        
                                
                                    
                                    let item = items[no]
                                    
                                    HStack(spacing:10){
                                        NavigationLink(destination:Item(itemType: item.category, name: item.name,image:item.image, price: item.price, text: item.description).navigationBarHidden(true)){
                                            FoodCardView(name: item.name,image:item.image, price: item.price)
                                                .padding([.leading,.trailing])
                                        }
                                        if no+1<items.count{
                                            
                                            let item2 = items[no+1]
                                            
                                            NavigationLink(destination:Item(itemType: item2.category, name: item2.name,image:item2.image, price: item2.price, text: item2.description).navigationBarHidden(true)){
                                                FoodCardView(name: item2.name,image:item2.image, price: item2.price)
                                                    .padding([.leading,.trailing])
                                            }
                                        }
//                                        Text("Untitled")
//                                            .foregroundColor(.gray)
//                                            .font(.system(size: 16))
//                                            .fontWeight(.light)
                                        
//                                        Button(action:{}){
//                                            ZStack{
//                                                RoundedRectangle(cornerRadius: 20)
//                                                    .fill(blackJetColor)
//                                                    .frame(width: 123, height: 34)
//                                                Text("Add to cart")
//                                                    .foregroundColor(.white)
//                                                    .font(.system(size: 16))
//                                                    .fontWeight(.medium)
//                                            }
//                                        }
                                        
                                    }
                                    .padding(.bottom,30)
                                    
                                
                            
                        }
                        
                    }
                    
                    Spacer()
                }
            }
        }
        
        
    }
    
    init(name:String="McDonald's",logo:String="mcdonald's_logo",stars:Float=4.8,distance:Float=5,noOfCoupons:Int = 0,items:Array<FoodItem>=FoodMockedData.shared.allFood){
        self.noOfCoupons = noOfCoupons
        self.name = name
        self.logo = logo
        self.stars = stars
        self.distance = distance
        self.items = items
    }

}
//
//struct Restaurant_Preview:PreviewProvider{
//    @State var iss=false
//    static var previews: some View{
//        Restaurant(items:kfcItemsArray)
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//        Restaurant()
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//    }
//}
