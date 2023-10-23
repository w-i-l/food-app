//
//  AddItemView.swift
//  Food
//
//  Created by mishu on 05.05.2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectionArray: [String]
   
    let name: String
    let keys: Array<String>
    let values: Array<Array<String>>
    let quantity: Int
    
    
    var body: some View {
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                
                //go back
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 20)
                        .padding()
                        .onTapGesture{
                            dismiss()
                        }
                    
                    Spacer()
                    
                    Text("Add to cart")
                        .foregroundColor(blackJetColor)
                        .font(.inter(.bold, size: 24))
                        .padding(.leading, -60)
                    
                    Spacer()
                }
            
                
                ScrollView(showsIndicators:false) {
                    
                    ForEach(0..<Int(quantity)) { no in
                        
                        HStack {
                            Text("Item #\(no + 1)")
                                .foregroundColor(.gray)
                                .font(.inter(.medium, size: 20))
                        Spacer()
                        }
                        .padding(.leading, 30)
                        
                        VStack (spacing: 20) {
                            
                            ForEach(keys, id: \.self) { item in
                                HStack {

                                    Text(item)
                                        .foregroundColor(blackJetColor)
                                        .font(.inter(.medium, size: 20))
                                    
                                    Spacer()
                                }
                                
                                VStack(spacing: 20) {
                                    ForEach(values[keys.firstIndex(of: item)!], id: \.self) { itm in
                                        HStack{
                                            let isSelected = selectionArray[keys.firstIndex(of: item)! + no*self.keys.count] == itm
                                            HStack {
                                                    ZStack {
                                                        
                                                        let size: CGFloat = 18
                                                        
                                                        Circle()
                                                            .fill(isSelected ? blackJetColor : .gray)
                                                            .frame(width: size, height: size)
                                                        
                                                        Circle()
                                                            .fill(isSelected ? blackJetColor :   backgroundWhite)
                                                            .frame(width: size - 5, height: size - 5)
                                                    }
                                                }
                                            
                                            Text(itm)
                                                .foregroundColor(isSelected ? blackJetColor : .gray)
                                                .font(.inter(.bold, size: 16))
                                            
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
                        
                        if quantity > 1 && no < quantity - 1  {
                            Divider()
                                .padding()
                        }
                        
                    }
                }
                .padding()
                
                Spacer()
                
                //process button
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(blackJetColor)
                            .frame(width: 200, height: 50)
                        .padding(.top)
                        
                        Text("PROCESS")
                            .font(.inter(.extraBold, size: 24))
                            .foregroundColor(.white)
                            .padding(.top,16)
                            
                        
                        }
                    .onTapGesture{
                        let item = FoodAPI.shared.getFoodItemBy(name: name)!
                        //add items to dict storage
                        CartService.shared.addItem(item: CartItemModel(
                            item: item,
                            selectedOptions: selectionArray
                        ), quantity: quantity)
                        dismiss()
                    }
                    .padding(.bottom)
            }
        }
    }
    
    init(
        keys: Array<String> = ["BigMac","Garniture","Drinks",],
        values: Array<Array<String>> = [[],["Fries","Dipping Fries"],["Coca-Cola","Fanta","Sprite","Prigat","Water"]],
        quantity: Int = 1,
        name: String="BigMac"
    ){
        self.keys = keys
        self.values = values
        self.quantity = quantity
        self._selectionArray = State(initialValue: Array(repeating: " ", count: self.keys.count * Int(self.quantity)))
        self.name = name
    }
}


struct Add_Preview:PreviewProvider{
    static var previews: some View{
        AddItemView(quantity:2)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
