//
//  APP.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct APP:View{
    
    @Binding var itemsInCart:[FoodItem:Int]
    @State var isShowingNavBar = false
    
//    @State var itemsInCart:[FoodItem:Int] = [:]
    
//    @State var itemsInCart:[FoodItem:Int] = [:]
    
    @State var selected = 0
    
    let iconsArray = ["house","safari","cart","person"]
    
    
    
    var body: some View{
        ZStack{
            backgroundWhite.ignoresSafeArea()
            
            VStack{
                ZStack{
                    switch selected{
                    case 0:
                        Home(itemsInCart: $itemsInCart)
                        
//                        Explore(itemsInCart: $itemsInCart)
                            
                    case 1:
//                        NavigationView{
//                            Search(itemsInCart: $itemsInCart)
//                                .navigationBarHidden(true)
//                        }
                        Explore(itemsInCart: $itemsInCart)
                    case 2:
                        Cart(itemsInCart: $itemsInCart)
                        
                    case 3:
                        Account()
                    
                    default:
                        Home(itemsInCart: $itemsInCart)
                    }
                    
                    
                }
                
                
                
                Spacer()
                
//                if !isShowingNavBar {
                    HStack(spacing:UIScreen.main.bounds.width/6){
                        ForEach(0..<4){num in
                            Button(action:{selected=num}){
                                Image(systemName: iconsArray[num])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:selected==num ? 50 : 30)
                                    .foregroundColor(selected==num ? blackJetColor : Color.init(red: 0.7, green: 0.7, blue: 0.7))
    //                                .clipped()
                                    .padding(0)
                                    .animation(.easeInOut(duration: 0.2))
                            }
                            
                        }
                        
                    }
                    
                    .padding(10)
                    .padding(.bottom,5)
                .frame(height:55)
                .transition(.move(edge: .bottom).combined(with: .opacity).animation(.easeInOut(duration: 0.05)))
                .clipped()
                .ignoresSafeArea(.keyboard, edges: .all)
                
//                }
                
                        
                    
                
            }
            
            .ignoresSafeArea(.keyboard, edges: .bottom)
//            .ignoresSafeArea()
            
        }
        
    }
}

struct APP_Preview:PreviewProvider{
    static var previews: some View{
        APP(itemsInCart: FoodApp().$itemsInCart)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
