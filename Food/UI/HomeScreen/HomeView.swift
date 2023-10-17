//
//  Home.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var textInput = "Search"
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundWhite.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    NavigationLink(destination:SearchView().navigationBarHidden(true)) {
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(grayColor)
                                .frame(height: 40)
                            
                            HStack {
                                
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.gray)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                                
                                Text("Search")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                                .fontWeight(.medium)
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                        }
                        .padding()
                    }
                    
                    ZStack {
                        Image("food")
                            .resizable()
                            .aspectRatio(3, contentMode: .fit)
                            .overlay(Color.gray.opacity(0.6))
                            .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 125)
                        
                        HStack {
                            Text("Today Lunch")
                                .foregroundColor(.white)
                                .font(.custom("Inter-Bold", size: 36))
                                .multilineTextAlignment(.leading)
                        }
                    }
                    
                    HStack {
                        Text("Categories")
                            .foregroundColor(.black)
                            .font(.inter(.medium, size: 16))
                    Spacer()
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:15) {
                            ForEach(0..<CategoriesMockedData.shared.categoryArray.count) { num in
                                
                                let item = CategoriesMockedData.shared.categoryArray[num]
                                
                                NavigationLink(destination:CategoryView(
                                    name: item.name,
                                    image: item.image,
                                    category: item.category
                                ).navigationBarHidden(true)) {
                                    CategoryCardView(
                                        text: item.name,
                                        image: item.image,
                                        color: item.color
                                    )
                                }
                            }
                        }
                        .padding(.leading,20)
                    }
                    
                    HStack {
                        Text("Restaurants")
                            .foregroundColor(blackJetColor)
                            .font(.inter(.medium, size: 16))
                            .padding(.leading, -10)
                        Spacer()
                        
//                        Text("View all")
//                            .foregroundColor(greenColor)
//                            .font(.custom("Inter-Medium", size: 12))
                        
                    }
                    .padding(40)
                    .padding(.bottom, -40)
                    
                    VStack {
                    
                        ForEach(Array(stride(from: 0, to: RestaurantAPI.shared.getAllRestaurants().count, by: 2)),id: \.self) { num in
                            
                            let first = RestaurantAPI.shared.getAllRestaurants()[num]
                           
                            HStack(spacing:25) {
                                
                                NavigationLink(destination:Restaurant(
                                    name: first.name,
                                    logo: first.logo,
                                    stars: first.stars,
                                    distance: first.distance,
                                    noOfCoupons: first.noOfcoupons,
                                    items: first.items
                                ).navigationBarHidden(true)) {
                                    RestaurantCardView(
                                        image: first.image,
                                        logo: first.logo
                                    )}
                                
                                if num+1 < RestaurantAPI.shared.getAllRestaurants().count {
                                    let second = RestaurantAPI.shared.getAllRestaurants()[num+1]
                                    NavigationLink(destination:Restaurant(
                                        name: second.name,
                                        logo: second.logo,
                                        stars: second.stars,
                                        distance: second.distance,
                                        noOfCoupons: second.noOfcoupons,
                                        items: second.items
                                    ).navigationBarHidden(true)) {
                                        RestaurantCardView(
                                            image: second.image,
                                            logo: second.logo
                                        )
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

