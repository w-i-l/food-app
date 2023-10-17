//
//  Category.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

struct CategoryStruct:View{
    
    let name:String
    let image:String
    let category:Category
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storage:Storage
    
    var body: some View{
        ZStack{
            backgroundWhite.ignoresSafeArea()
            
            VStack{
                
                HStack{
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width:30)
                        .padding()
                        .onTapGesture{dismiss()}
                    
                    Spacer()
                    
                }
                
                HStack{
                    
                   
                    
                    Text(name)
                        .foregroundColor(blackJetColor)
                        .font(.system(size:36))
                        .fontWeight(.bold)
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 50, height: 50)
                        
                    
                    Spacer()
                    
                }
                .padding([.leading,.top],30)
                
                
                ScrollView(showsIndicators:false) {
                    VStack(spacing:20){
                        ForEach(Array(stride(from: 0, to: Array(FoodAPI.shared.getAllFood().filter{$0.category == category}).count, by: 2)),id:\.self){num in
                            
                            
                            let array = Array(FoodAPI.shared.getAllFood().filter{$0.category == self.category})
                            let item = array[num]
                           
                            
                            HStack(spacing:10){
                                
                                    NavigationLink(destination:Item(itemType: item.category, name: item.name,image:item.image, price: item.price, text: item.description).navigationBarHidden(true)){
                                        FoodCard(name: item.name,image:item.image, price: item.price)
                                            .padding([.leading,.trailing])
                                    }
                                
                                if num+1 < array.count{
                                    let item2 = array[num+1]

                                    NavigationLink(destination:Item(itemType: item2.category, name: item2.name,image:item2.image, price: item2.price, text: item2.description).navigationBarHidden(true)){
                                        FoodCard(name: item2.name,image:item2.image, price: item2.price)
                                            .padding([.leading,.trailing])
                                    }
                                }
                               
                            }
                        }
                    }
                }
                
                
                
                Spacer()
                
            }
            .ignoresSafeArea(edges: .bottom)
            
        }
    }
    
    init(name:String="Burger",image:String="burger",category:Category = .burger){
        self.name = name
        self.image = image
        self.category = category
    }
    
}

//struct Category_Previews:PreviewProvider{
//    static var previews: some View{
//        NavigationView {
//            CategoryStruct(category:.chicken)
//                .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13")
//            .navigationBarHidden(true)
//        }
//    }
//}
