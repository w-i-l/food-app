//
//  Add.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct Add:View{
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var itemsInCart:[FoodItem:Int]
   
    let name:String
    let keys:Array<String>
    let values:Array<Array<String>>
    let quantity:Int
    
    @State var selectionArray:[String]
    
    @State var selected:String = "Fanta"
    
    var body: some View{
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
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
            
                Text("Add to cart")
                    .foregroundColor(blackJetColor)
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.top,-20)
                
                
                ScrollView(showsIndicators:false) {
                    
                    
                   
                    
                    
                    ForEach(0..<Int(quantity)) {no in
                        VStack (spacing:20){
                            ForEach(keys,id:\.self){item in
                                HStack {

                                    Text(item)
                                        .foregroundColor(blackJetColor)
                                        .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                
                                VStack(spacing:20){
                                    ForEach(values[keys.firstIndex(of: item)!],id:\.self){itm in
                                        HStack{
                                            HStack {
                                                
        //                                        Button(action:{//remember the last selection from each group
        //                                            selectionArray[keys.firstIndex(of: item)!] = itm
        ////
        //
        //                                        }) {
                                                    ZStack{
                                                        Circle()
                                                            .fill(blackJetColor)
                                                            .frame(width:22,height:22)
                                                        Circle()
                                                            .fill(selectionArray[keys.firstIndex(of: item)! + no*self.keys.count] == itm ? blackJetColor :   backgroundWhite)
                                                            .frame(width:17,height:17)
                                                    }
                                                }
    //                                        .tag(itm)
                                            
                                            Text(itm)
                                                .foregroundColor(blackJetColor)
                                                .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            
                                            Spacer()
                                    }.onTapGesture{
                                        //remember the last selection from each group
                                        selectionArray[keys.firstIndex(of: item)! + no*self.keys.count] = itm
                                    }
                                    
                                        
                                        .padding(.leading,40)
                                    }
                                }
                                .frame(alignment:.leading)
                                .padding(.bottom)
                            }
                        }
                        .padding(.leading,30)
                        
                        if quantity > 1  {
                            Divider()
                                .padding()
                        }
                        
                    }
                    
//                .frame(width: UIScreen.main.bounds.width-50, height: UIScreen.main.bounds.height-300,alignment:.leading)
                }
                .padding()
                
                Spacer()
                
                
                //process button
//                NavigationLink(destination:Add().navigationBarHidden(true)){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(blackJetColor)
                            .frame(width: 200, height: 50)
                        .padding(.top)
                        
                        Text("PROCESS")
                            .font(.system(size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.top,16)
                            
                        
                        }
                    .onTapGesture{
                        //add items to dict storage
                        itemsInCart[allFood[allFood.firstIndex(of:allFood.filter{$0.name==name}[0]) ?? 0]] = (itemsInCart[allFood[allFood.firstIndex(of:allFood.filter{$0.name==name}[0]) ?? 0]] ?? 0) + quantity
//                        print(itemsInCart)
                        
                        dismiss()
                        
                        
                        
                    } //schimba la firebase
                    .padding(.bottom)
            }
            
            
        }
    }
    
//    init(items:[String:Array<String>] = ["BigMac": [],"Garniture": ["Fries","Dipping Fries"],"Drinks": ["Coca-Cola","Fanta","Sprite","Prigat","Water"]]){
    
    init(itemsInCart:Binding<[FoodItem:Int]>,keys:Array<String>=["BigMac","Garniture","Drinks",],values:Array<Array<String>> = [[],["Fries","Dipping Fries"],["Coca-Cola","Fanta","Sprite","Prigat","Water"]],quantity:Int = 1,name:String="BigMac"){
        
    self.keys = keys
    self.values = values
    self.quantity = quantity
    self._selectionArray = State(initialValue: Array(repeating: " ", count: self.keys.count * Int(self.quantity)))
    self.name = name
    self._itemsInCart=itemsInCart
        
    }
}


//struct Add_Preview:PreviewProvider{
//    static var previews: some View{
//        Add(quantity:2)
//            .preferredColorScheme(.dark)
//            .previewDevice("iPhone 13")
//    }
//}
