//
//  Explore.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct Explore:View{
    
    let noOfFavoritePlatesPairs = 3
    let favoritePlates:Array<Int>
    @Binding var itemsInCart:[FoodItem:Int]
    
    var body: some View{
        
        NavigationView {
            ZStack {
                backgroundWhite.ignoresSafeArea()
                
                ScrollView(showsIndicators:false) {
                    VStack{
                        
                        HStack {
                            Text("Pick your meal")
                                .foregroundColor(blackJetColor)
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                                .padding()
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("Categories")
                                .foregroundColor(blackJetColor)
                                .font(.custom("Inter-Medium", size: 16))
                                .padding(.leading,-10)
                            
                            Spacer()
//
//                            Text("View all")
//                                .foregroundColor(greenColor)
//                                .font(.custom("Inter-Medium", size: 12))
                            
                        }
                        .padding(40)
                        .padding(.bottom,-40)
                        
                        //categories
                        VStack(spacing:15){
                            ForEach(0..<2){num in
                                HStack(spacing:20){
                                    ForEach(0..<4){no in
                                        
                                        let item = categoryArray[num*4+no]
                                        
                                        NavigationLink(destination:CategoryStruct(itemsInCart:$itemsInCart,name: item.name, image: item.image, category: item.category).navigationBarHidden(true)) {
                                            CategoryCard(text: item.name, image: item.image,width:70,height:70, color: item.color)
                                        }
                                            
                                    }
                                    
                                }
                                
                            }
                        }
                        .padding()
                        
                        Divider()
                            .padding([.leading,.trailing],30)
                        
                        
                        
                        //top picked
//                        NavigationLink(destination:Item().navigationBarHidden(true)) {
                            HStack {
                                Text("Top picked")
                                    .foregroundColor(blackJetColor)
                                    .font(.system(size: 24))
                                .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .padding()
                            .padding(.leading,10)
//                        }
                        
                        NavigationLink(destination:Item(itemsInCart:$itemsInCart,itemType: .pizza, name: "Diavola", image: "diavola", price: 11.59, text: "Pizza diavola is a style of pizza in Italian cuisine made with mozzarella cheese, Italian ham, mushrooms, artichokes and tomatoes. The types of edible mushrooms used may include creams and more.").navigationBarHidden(true)) {
                            ZStack {
                                Image("food")
                                    .resizable()
                                    .aspectRatio(1.5,contentMode:.fit)
                                    .frame(height:200)
                                    .overlay(.gray.opacity(0.6))
                                    .cornerRadius(20)
                               
                                
                                HStack{
                                  Text("Italian\nPizza")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(.leading,80)
                                
                            }
                            .padding(.bottom,40)
                        }
                        
                        
                        //Favorite plates
                        HStack {
                            Text("Favorite plates")
                                .foregroundColor(blackJetColor)
                                .font(.system(size: 24))
                            .fontWeight(.regular)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.leading,10)
                        
                        //favorite plates
                        VStack(spacing:20){
                            ForEach(0..<noOfFavoritePlatesPairs){num in
                                HStack(spacing:40) {
                                    ForEach(0..<2){no in
                                        let item = allFood[num*2+no]
                                        
                                        NavigationLink(destination:Item(itemsInCart:$itemsInCart,itemType: item.category, name: item.name, image: item.image, price: item.price, text: item.description).navigationBarHidden(true)){
                                            FoodCard(name: item.name, image: item.image, price: item.price)
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
    
    init(itemsInCart:Binding<[FoodItem:Int]>){
        self._itemsInCart=itemsInCart
        favoritePlates = Array(repeating: Int.random(in: 0..<allFood.count), count: noOfFavoritePlatesPairs*2)
    }
    
}


//struct Explore_Preview:PreviewProvider{
//    static var previews: some View{
//        NavigationView {
//            Explore()
//                .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13")
//            .navigationBarHidden(true)
//        }
//
//    }
//}
