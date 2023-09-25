//
//  Home.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct Home:View{
    
    @State var textInput = "Search"
    @EnvironmentObject var storage:Storage
    
//    @Binding var isShowingNavBar:Bool
//    @State var isShowingNavBarArray = Array.init(repeating: false, count: restaurantsArray.count){willSet{
//        for item in newValue{
//            if item==true{
//                isShowingNavBar = true
//                break
//            }
//        }
//        isShowingNavBar = false
//    }}
    
    var body: some View{
        NavigationView {
            ZStack{
                backgroundWhite.ignoresSafeArea()
                
                ScrollView{
                    
                    NavigationLink(destination:Search().navigationBarHidden(true)) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(grayColor)
                                .frame(height: 40)
                            Text("Search")
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                        }
                        .padding()
                    }
                    
                    
                    ZStack{
                        Image("food")
                            .resizable()
                            .aspectRatio(3,contentMode: .fit)
                            .overlay(.gray.opacity(0.6))
                            .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width-40,height:125)
                        
                        HStack {
                            Text("Today\nLunch")
    //                            .font(.system(size: 36))W
                                .foregroundColor(.white)
                                .font(.custom("Inter-Bold", size: 36))
                                .multilineTextAlignment(.leading)
                               
    //                        .bold()
                            
                            Spacer()
                        }
                        .padding(.leading,60)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:15){
                            ForEach(0..<categoryArray.count){num in
                                
                                let item = categoryArray[num]
                                
                                NavigationLink(destination:CategoryStruct(name: item.name, image: item.image, category: item.category).navigationBarHidden(true)) {
                                    CategoryCard(text: item.name, image: item.image,color: item.color)
                                }
                                
                            }
                        }
                        .padding(.leading,20)
                    }
                    
                    .padding(.top,30)
                    
                    HStack{
                        Text("Restaurants")
                            .foregroundColor(blackJetColor)
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .padding(.leading,-10)
                        Spacer()
                        
//                        Text("View all")
//                            .foregroundColor(greenColor)
//                            .font(.custom("Inter-Medium", size: 12))
                        
                    }
                    .padding(40)
                    .padding(.bottom,-40)
                    
                    VStack{
                    
                        ForEach(Array(stride(from: 0, to: restaurantsArray.count, by: 2)),id:\.self){num in
                            
                            let first = restaurantsArray[num]
                           
                            HStack(spacing:25){
                                
                                NavigationLink(destination:Restaurant(name: first.name, logo: first.logo, stars: first.stars, distance: first.distance, noOfCoupons: first.noOfcoupons, items: first.items).navigationBarHidden(true)){
                                    RestaurantCard(image: first.image, logo: first.logo)}
                                
                                if num+1<restaurantsArray.count{
                                    let second = restaurantsArray[num+1]
                                    NavigationLink(destination:Restaurant(name: second.name, logo: second.logo, stars: second.stars, distance: second.distance, noOfCoupons: second.noOfcoupons, items: second.items).navigationBarHidden(true)){
                                       
                                        RestaurantCard(image: second.image, logo: second.logo)
                                        
                                    }
                                }
                            }
                       
                        }
                        
                        
                    }
                                
                            
                        
                        
                    
                }
               
                
            }
            .navigationBarHidden(true)
        }
        
        
    }
}
//
struct Home_Preview:PreviewProvider{
    static var previews: some View{

        NavigationView {
            ZStack {
                Home()
                    .previewDevice("iPhone 13")
                    .preferredColorScheme(.dark)
                }
            .navigationBarHidden(true)
            }

        }
    }

