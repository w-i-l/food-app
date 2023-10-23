//
//  CartView.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CartViewModel()
    @State var arrayItems:[FoodItem:Int] = [:]
    
    var sum: Float {
        get {
            var suma:Float = 0
            for x in viewModel.cartItems.keys {
                suma += x.item.price * Float(viewModel.cartItems[x]!)
            }
            return suma
        }
    }

    var body:some View {
        
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack{
                
                HStack {
                    Text("Cart")
                        .foregroundColor(blackJetColor)
                        .font(.inter(.bold, size: 32))
                        .padding()
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    Text(String(format: "$%.2f", sum))
                        .foregroundColor(blackJetColor)
                        .font(.inter(.extraLight, size: 18))
                        .padding()
                        .padding(.bottom,40)
                    
                }
                
                if viewModel.cartItems.isEmpty{
                    
                    Spacer()
                    
                    Text("Add items in cart")
                        .foregroundColor(blackJetColor)
                        .font(.inter(.extraLight, size: 24))
                }
                else{
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing:25) {
                            let dictAsArray = viewModel.cartItems.sorted(by: { $0.key.item.id < $1.key.item.id })
                            ForEach(dictAsArray, id:\.key) { cartItem in
                                
                                let item = cartItem.key.item
                                
                                Group {
                                    HStack {
                                        
                                        ItemCardView(
                                            name: item.name,
                                            image: item.image,
                                            price: item.price,
                                            quantity: cartItem.value
                                        )
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 20) {
                                            Button(action: {
                                                CartService.shared.increaseQuantity(item: cartItem.key)
                                            }){
                                                ZStack {
                                                    Circle()
                                                        .fill(blackJetColor)
                                                        .frame(width: 25,height: 25)
                                                    
                                                    Text("+")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20))
                                                }
                                            }
                                            
                                            Text("\(cartItem.value)")
                                                .foregroundColor(blackJetColor)
                                                .font(.system(size: 18))
                                                .fontWeight(.light)
                                            
                                            Button(action: {
                                                CartService.shared.decreaseQuantity(item: cartItem.key)
                                            }){
                                                ZStack {
                                                    Circle()
                                                        .fill(blackJetColor)
                                                        .frame(width: 25,height: 25)
                                                    
                                                    Text("-")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20))
                                                }
                                            }
                                        }
                                        .padding([.leading,.trailing],20)
                                    }

                                    Divider()
                                        .padding([.leading,.trailing],25)
                                }
                                .frame()
                            }
                        }
                        .padding([.leading,.trailing],20)
                    }
                    
                }
                Spacer()
                
                // checkout
                Button(action:{
                    dismiss()
                }){
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(blackJetColor)
                            .frame(width: 200, height: 50)
                            .padding(.top)
                        
                        Text("CHECKOUT")
                            .font(.inter(.bold, size: 24))
                            .foregroundColor(.white)
                            .padding(.top, 16)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}
