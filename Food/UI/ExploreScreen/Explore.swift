//
//  ExploreView.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct ExploreView: View {
    
    private let favoritePlates: Array<Int>
    private let noOfFavoritePlatesPairs = 3
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                backgroundWhite.ignoresSafeArea()
                
                ScrollView(showsIndicators:false) {
                    VStack {
                        
                        HStack {
                            Text("Pick your meal")
                                .foregroundColor(blackJetColor)
                                .font(.inter(.bold, size: 28))
                                .padding()
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("Categories")
                                .foregroundColor(.gray)
                                .font(.custom("Inter-Medium", size: 16))
                                .padding(.leading,-10)
                            
                            Spacer()
//
//                            Text("View all")
//                                .foregroundColor(greenColor)
//                                .font(.custom("Inter-Medium", size: 12))
                            
                        }
                        .padding(40)
                        .padding(.bottom, -40)
                        
                        //categories
                        VStack(spacing: 15) {
                            ForEach(0..<2) { num in
                                HStack(spacing: 20) {
                                    ForEach(0..<4) { no in
                                        
                                        let item = CategoriesMockedData.shared.categoryArray[num * 4 + no]
                                        
                                        NavigationLink(destination: CategoryView(
                                            name: item.name,
                                            image: item.image,
                                            category: item.category
                                        ).navigationBarHidden(true)) {
                                            CategoryCardView(
                                                text: item.name,
                                                image: item.image,
                                                width: 70,
                                                height: 70,
                                                color: item.color
                                            )
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        Divider()
                            .padding(.horizontal, 30)
                        
                        //top picked
//                        NavigationLink(destination:FoodItemView().navigationBarHidden(true)) {
                            HStack {
                                Text("Top picked")
                                    .foregroundColor(blackJetColor)
                                    .font(.inter(.semiBold, size: 24))
                                
                                Spacer()
                            }
                            .padding()
                            .padding(.leading, 10)
//                        }
                        
                        NavigationLink(destination: FoodItemView(
                            itemType: .pizza,
                            name: "Diavola",
                            image: "diavola",
                            price: 11.59,
                            text: "Pizza diavola is a style of pizza in Italian cuisine made with mozzarella cheese, Italian ham, mushrooms, artichokes and tomatoes. The types of edible mushrooms used may include creams and more."
                        ).navigationBarHidden(true)) {
                            ZStack {
                                Image("food")
                                    .resizable()
                                    .aspectRatio(1.5, contentMode: .fit)
                                    .frame(height: 200)
                                    .overlay(Color.gray.opacity(0.6))
                                    .cornerRadius(20)
                                
                                HStack {
                                  Text("Italian\nPizza")
                                        .foregroundColor(.white)
                                        .font(.inter(.semiBold, size: 28))
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.leading, 80)
                                
                            }
                            .padding(.bottom, 40)
                        }
                        
                        //Favorite plates
                        HStack {
                            Text("Favorite plates")
                                .foregroundColor(blackJetColor)
                                .font(.inter(.regular, size: 20))
                            
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.leading, 10)
                        
                        //favorite plates
                        VStack(spacing: 20) {
                            ForEach(0..<noOfFavoritePlatesPairs) { num in
                                HStack(spacing: 40) {
                                    ForEach(0..<2) { no in
                                        let item = FoodAPI.shared.getAllFood()[num * 2 + no]
                                        
                                        NavigationLink(destination: FoodItemView(
                                            itemType: item.category,
                                            name: item.name,
                                            image: item.image,
                                            price: item.price,
                                            text: item.description
                                        ).navigationBarHidden(true)) {
                                            FoodCardView(
                                                name: item.name,
                                                image: item.image,
                                                price: item.price
                                            )
                                        }
                                    }
                                }
                            }
                        }
                            
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    init() {
        favoritePlates = Array(repeating: Int.random(in: 0..<FoodAPI.shared.getAllFood().count), count: noOfFavoritePlatesPairs * 2)
    }
}


struct Explore_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13")
                .navigationBarHidden(true)
        }

    }
}
