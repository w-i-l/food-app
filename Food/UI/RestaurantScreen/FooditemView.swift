//
//  FoodItemView.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct FoodItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let itemType: Category
    let name: String
    let image: String
    let price: Float
    let text: String
    
    @State private var quantity: Int = 1
    
    
    var body: some View {
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            ZStack {
                VStack {
                    
                    //go back
                    HStack{
                        
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(blackJetColor)
                            .frame(width: 20)
                            .padding()
                            .onTapGesture {
                                dismiss()
                                
                            }
                        Spacer()
                    }
                    
                    HStack {
                        
                        //icon
                        Image(itemType.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width: 32)
                            
                        //name
                        Text(name)
                            .foregroundColor(blackJetColor)
                            .font(.inter(.bold, size: 32))
                        
                    }
                    
                    //price
                    Text(String(format: "$%.2f", price))
                        .foregroundColor(.gray)
                        .font(.inter(.extraLight, size: 20))
                    
                    //display image
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width:200,height:200)
                        .padding(.top,30)
                    
                    //info text
                    ScrollView(showsIndicators:false) {
                        Text(text)
                            .foregroundColor(.gray)
                            .font(.inter(.extraLight, size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(50)
                    }
                    
                    
                    HStack {
                        
                        // + button
                        Button(action: {
                            quantity += 1
                        }){
                            ZStack {
                                Circle()
                                    .fill(blackJetColor)
                                    .frame(width: 53, height: 53)
                            
                        
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.inter(.bold, size: 24))
                        
                            }
                        }
                        .padding(.top,40)
                        .padding(.trailing,10)
                        
                              
                        //add button
                        NavigationLink(destination:AddItemView(keys:FoodAPI.shared.getAllFood().filter{$0.name == self.name}[0].menuItemsKeys,values:FoodAPI.shared.getAllFood().filter{$0.name == self.name}[0].menuItemsValues,quantity:quantity,name:self.name).navigationBarHidden(true)){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(blackJetColor)
                                    .frame(width: 200, height: 50)
                                .padding(.top)
                                
                                Text("ADD " + String(quantity))
                                    .font(.inter(.extraBold, size: 24))
                                    .foregroundColor(.white)
                                    .padding(.top,16)
                                }
                            }
                            
                        // - button
                            Button(action: {
                                if quantity > 1{
                                    quantity -= 1
                                }
                            }){
                                ZStack {
                                    
                                    Circle()
                                        .fill(blackJetColor)
                                        .frame(width: 53, height: 53)
                                
                            
                                    Text("-")
                                        .foregroundColor(.white)
                                        .font(.inter(.bold, size: 24))
                            
                                }
                            }
                            .padding(.top, 40)
                            .padding(.leading, 10)
                            
                }
                    Spacer()
                }
                
            }
        }
    }
}

struct Item_Preview: PreviewProvider {
    static var previews: some View {
        let item = FoodMockedData.shared.kfcItemsArray.first!
        FoodItemView(
            itemType: item.category,
            name: item.name,
            image:item.image,
            price: item.price,
            text: item.description
        )
        .previewDevice("iPhone 13")
        .preferredColorScheme(.dark)
    }
}
