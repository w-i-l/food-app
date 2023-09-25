//
//  Item.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct Item:View{
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var storage:Storage
    
    let itemType:Category
    let name:String
    let image:String
    let price:Float
    let text:String
    
    @State public var quantity:Int = 1
    
    
    var body: some View{
        ZStack {
            backgroundWhite.ignoresSafeArea()
            
            ZStack {
                VStack{
                    
                    //go back
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
                        //icon
                        Image(itemType.rawValue)
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .foregroundColor(blackJetColor)
                            .frame(width:32)
                            
                        //name
                        Text(name)
                            .foregroundColor(blackJetColor)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                        
                    }
                    
                    //price
                    Text(String(format: "$%.2f", price))
                        .foregroundColor(blackJetColor)
                        .fontWeight(.medium)
                        .font(.system(size: 24))
                    
                    //display image
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width:200,height:200)
                        
                        .foregroundColor(blackJetColor)
                        
                        .padding(.top,30)
                    
                    //info text
                    ScrollView(showsIndicators:false) {
                        Text(text)
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        .padding(50)
                    }
                    
                    
                    HStack {
                        // + button
                        Button(action:{
                            quantity += 1
                        }){
                            ZStack{
                                Circle()
                                    .fill(blackJetColor)
                                    .frame(width: 53, height: 53)
                            
                        
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32))
                        
                            }
                        }
                        .padding(.top,40)
                        .padding(.trailing,10)
                        
                              
                        //add button
                        NavigationLink(destination:Add(keys:allFood.filter{$0.name == self.name}[0].menuItemsKeys,values:allFood.filter{$0.name == self.name}[0].menuItemsValues,quantity:quantity,name:self.name).navigationBarHidden(true)){
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(blackJetColor)
                                    .frame(width: 200, height: 50)
                                .padding(.top)
                                
                                Text("ADD " + String(quantity))
                                    .font(.system(size: 24))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.top,16)
                                    
                                
                                }
                            }
                            
                        // - button
                            Button(action:{
                                if quantity > 1{
                                    quantity -= 1
                                }
                            }){
                                ZStack{
                                    Circle()
                                        .fill(blackJetColor)
                                        .frame(width: 53, height: 53)
                                
                            
                                    Text("-")
                                        .foregroundColor(.white)
                                        .font(.system(size: 32))
                            
                                }
                            }
                            .padding(.top,40)
                            .padding(.leading,10)
                            
                }
                        
                    Spacer()
                    
                    
                    
                }
                
            }
            
            
        }
    }
    
    init(itemType:Category = .burger,name:String="BigMac",image:String="bigmac" ,price:Float=6.99,text:String="""
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """){
        self.itemType = itemType
        self.name = name
        self.price = price
        self.text = text
        self.image = image
    }
    
}

//struct Item_Preview:PreviewProvider{
//    static var previews: some View{
//
//        let item = crispystrips
//        Item(itemType: item.category, name: item.name,image:item.image, price: item.price, text: item.description)
////        Item()
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//    }
//}
