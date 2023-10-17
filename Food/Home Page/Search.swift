//
//  Search.swift
//  Food
//
//  Created by mishu on 07.05.2022.
//

import SwiftUI

struct Search:View{
    
    @State var textInput:String = ""
    @EnvironmentObject var storage:Storage
    
    let basicText = "Search"
    
    @Environment(\.dismiss) var dismiss
    
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
                        .padding(.leading)
                        .onTapGesture{dismiss()}
                    
                    Spacer()
                    
                    ZStack {
                        TextField("Search", text: $textInput)
                            .foregroundColor(.gray)
                            .font(.system(size:18))
                            .padding()
                            .padding(.leading,30)
                            .frame(height:40)
                            .background(grayColor)
                            .cornerRadius(20)
                            .padding()
                            .disableAutocorrection(true)
    //                        .padding(.leading,40)
    //                        .onTapGesture {
    //                            if textInput=="Search"{
    //                                textInput = ""
    //                            }
    //                        }
    //                        .onSubmit {
    //                            if textInput==""{
    //                                textInput="Search"
    //                            }
    //                        }
                        
                        HStack {
                            
                            Image(systemName:"magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:24,height:24)
                                .foregroundColor(.gray)
                                .padding(.leading,30)
                            
                            Spacer()
                            
                            Button(action:{
    //                            if textInput != "Search"{
                                    textInput=""
    //                            }
                                
                            }) {
                                ZStack{
                                    Circle()
                                        .fill(.gray)
                                        .frame(width:24,height:24)
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(grayColor)
                                        .frame(width: 12, height: 2)
                                        .rotationEffect(Angle(degrees: 45))
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(grayColor)
                                        .frame(width: 12, height: 2)
                                        .rotationEffect(Angle(degrees: -45))
                                }
                            }
                            .opacity(textInput.isEmpty ? 0 : 1)
    //                        .transition(.slide)
//                            .animation(.easeOut)
                            
                        }
                        .padding(.trailing,30)
                        
                        }
                    
                }
                
                
                
                
                
                
                ScrollView(showsIndicators:false) {
                    ForEach(Array(stride(from: 0, to: searchArray.count, by: 2)),id:\.self){no in
                        
                        let first = searchArray[no]
                        HStack(spacing:30){

                            NavigationLink(destination:Item(itemType: first.category, name: first.name, image: first.image, price: first.price, text: first.description).navigationBarTitle("").navigationBarHidden(true)) {
                                FoodCard(name: first.name, image: first.image, price: first.price)
                            }
                            if no+1<searchArray.count{
                                
                                let second = searchArray[no+1]
                            
                                NavigationLink(destination:Item(itemType: second.category, name: second.name, image: second.image, price: second.price, text: second.description).navigationBarHidden(true).navigationBarTitle("")) {
                                    FoodCard(name: second.name, image: second.image, price: second.price)
                                }
                            }
                        }
//                        .animation(.easeInOut)
                    }
//                    .transition(.scale.animation(.default))
                    
                }
                
                
                    
                
                Spacer()
            }
            .ignoresSafeArea(edges:.bottom)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            
            
            
        }
        
        
    }
    
    var searchArray:[FoodItem]{
        
        if textInput.isEmpty{
            return FoodAPI.shared.getAllFood()
        }
        else if FoodAPI.shared.getAllFood().filter({$0.name.lowercased().starts(with:textInput.lowercased())}).count == 0{
//        else if FoodAPI.shared.getAllFood().filter({$0.name.lowercased().contains(textInput.lowercased())}).count == 0{
            return []
        }
        else{
            return FoodAPI.shared.getAllFood().filter{$0.name.lowercased().starts(with:textInput.lowercased())}
            
        }
        
    }
    
}

//struct Search_Preview:PreviewProvider{
//    static var previews: some View{
//        NavigationView {
//            Search()
//                .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//            .navigationBarHidden(true)
//        }
//    }
//}
//    
