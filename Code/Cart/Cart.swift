//
//  Cart.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

//struct Buttons:View{
////    @ObservedObject var quantityArray:Storage
//    var body: some View{
//
//    }
//}

struct Cart:View{
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var itemsInCart:[FoodItem:Int]
    
//    @ObservedObject var quantityArray:Storage
    
    
    var sum:Float{
        get {
            var suma:Float = 0
            for x in itemsInCart.keys{
                suma += x.price * Float(itemsInCart[x]!)
            }
            return suma
        }
        
    }
    
    @State var arrayItems:[FoodItem:Int] = [:]
    
    var body:some View{
        
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack{
                
                HStack {
                    Text("Cart")
                        .foregroundColor(blackJetColor)
                        .font(.system(size:36))
                        .fontWeight(.bold)
//                        .padding(.leading,30)
                        .padding()
                        .padding(.bottom,40)
                        
                    Spacer()
                    
                    Text(String(format: "$%.2f", sum))
                        .foregroundColor(blackJetColor)
                        .font(.system(size:18))
                        .fontWeight(.light)
                        .padding()
                        .padding(.bottom,40)
                    
                }
                
                if itemsInCart.isEmpty{
                    
                    Spacer()
                    
                    Text("Add items in cart")
                        .foregroundColor(blackJetColor)
                        .font(.system(size:24))
                        .fontWeight(.light)
                }
                else{
                
                    ScrollView(showsIndicators:false) {
                    VStack(spacing:25) {
                        ForEach(Array(itemsInCart.keys),id:\.self){item in
                            Group{
                                HStack(){
                                    
                                    var a = ItemCard(name: item.name, image: item.image, price: item.price, quantity: itemsInCart[item] ?? 0)
                                    
                                    
                                    
                                    a
                                    
                                        
                                    
                                    Spacer()
                                    HStack(spacing:20){
                                        Button(action:{
                                            itemsInCart[item]! += 1
        //                                    quantityArray[item]! += 1
                                        }){
                                            ZStack {
                                                Circle()
                                                    .fill(blackJetColor)
                                                    .frame(width:25,height:25)
                                                
                                                Text("+")
                                                    .foregroundColor(.white)
                                                    .font(.system(size:20))
                                            }
                                        }
                                        
                                        Text("\(itemsInCart[item]!)")
                                            .foregroundColor(blackJetColor)
                                            .font(.system(size:18))
                                            .fontWeight(.light)
        //                                    .frame(width:30,height:20)
        //                                    .frame(width:100,height:30)
                                            
                                            
                                        
                                        Button(action:{
                                            
                                            if itemsInCart[item] != nil{
                                                if(itemsInCart[item]! == 1){
                                                    withAnimation(.default){
                                                        itemsInCart[item] = nil
                                                    }
                                            }
                                            else{
                                                itemsInCart[item]! -= 1
                                            }
                                        }
                                            
    //                                        itemsInCart[item]! -= itemsInCart[item]! > 1 ? 1 : 0
                                        }){
                                            ZStack {
                                                Circle()
                                                    .fill(blackJetColor)
                                                    .frame(width:25,height:25)
                                                
                                                Text("-")
                                                    .foregroundColor(.white)
                                                    .font(.system(size:20))
                                            }
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    .padding([.leading,.trailing],20)
                                    
                            }
                                
                                
                               
                                
                                Divider()
                                    .padding([.leading,.trailing],25)
                            }
                            
                            .frame()
//                            .gesture(
//                                DragGesture(minimumDistance: 50)
//                                    .onEnded { event in
//                                        withAnimation(.default){
//                                            print(event.translation.width)
//                                            if event.translation.width<0{
//                                                itemsInCart[item] = nil
//
//                                            }
//                                        }
//                                    }
//                            )
                        
                        }
                    }
                    .padding([.leading,.trailing],20)
                }
                
                }
                Spacer()
                
                Button(action:{//Checkout action
//                    print(dynamicArray)
                    dismiss()
                    
                }){
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(blackJetColor)
                            .frame(width: 200, height: 50)
                        .padding(.top)
                        
                        Text("CHECKOUT")
                            .font(.system(size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.top,16)
                            
                        
                        }
                    
                }
                .padding(.bottom)
                
            }
            
            
        }
        
//
//        init(quantityArray:Binding<[FoodItem:Int]> = $itemsInCart){
//            self._quantityArray = $itemsInCart
//
//        }
        
       
        
        
    }
        

//    init( quantityArray: Binding<[FoodItem:Int]){
//        _quantityArray = State(initialValue: quantityArray)
//    }
        
}

//struct Cart_Preview:PreviewProvider{
//   
//    @StateObject var quantityArray = Storage()
//    
//    static var previews:some View{
//        Cart(APP.$itemsInCart)
//            .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13")
//    }
//}
