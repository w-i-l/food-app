//
//  Category.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    
    @Published var foodItems: [FoodItem]
    
    init(category: Category) {
        self.foodItems = FoodAPI.shared.getFoodFrom(category: category)
    }
}

struct CategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CategoryViewModel
    
    let name: String
    let image: String
    let category: Category
    
    var body: some View {
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                
                // back button
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 20)
                        .onTapGesture{
                            dismiss()
                            
                        }
                        .padding(20)
                    
                    Spacer()
                    
                    HStack {
                        
                        Text(name)
                            .foregroundColor(blackJetColor)
                            .font(.inter(.regular, size: 24))
                        
                        Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(blackJetColor)
                            .frame(width: 28, height: 28)
                    }
                    .padding(.leading, -60)
                    
                    Spacer()
                }
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        ForEach(Array(stride(from: 0, to: viewModel.foodItems.count, by: 2)), id: \.self) { num in
                            
                            let item = viewModel.foodItems[num]
                            
                            HStack(spacing:10){
                                
                                NavigationLink(destination: FoodItemView(
                                    itemType: item.category,
                                    name: item.name,
                                    image:item.image,
                                    price: item.price,
                                    text: item.description
                                ).navigationBarHidden(true)) {
                                    FoodCardView(
                                        name: item.name,
                                        image:item.image,
                                        price: item.price
                                    )
                                    .padding(.horizontal)
                                }
                                
                                if num+1 < viewModel.foodItems.count {
                                    let item2 = viewModel.foodItems[num + 1]
                                    
                                    NavigationLink(destination: FoodItemView(
                                        itemType: item2.category,
                                        name: item2.name,
                                        image:item2.image,
                                        price: item2.price,
                                        text: item2.description
                                    ).navigationBarHidden(true)){
                                        FoodCardView(
                                            name: item2.name,
                                            image:item2.image,
                                            price: item2.price
                                        )
                                        .padding(.horizontal)
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
    
    init(
        name: String = "Burger",
        image: String = "burger",
        category: Category = .burger
    ){
        self.name = name
        self.image = image
        self.category = category
        self._viewModel = StateObject(wrappedValue: CategoryViewModel(category: category))
    }
    
}

struct Category_Previews:PreviewProvider{
    static var previews: some View{
        NavigationView {
            CategoryView(category:.burger)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13")
                .navigationBarHidden(true)
        }
    }
}
