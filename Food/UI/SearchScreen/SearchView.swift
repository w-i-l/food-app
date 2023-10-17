//
//  SearchView.swift
//  Food
//
//  Created by mishu on 07.05.2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @EnvironmentObject private var storage: Storage
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 20)
                        .padding(.leading)
                        .onTapGesture {
                            dismiss()
                            
                        }
                    
                    Spacer()
                    
                    ZStack {
                        TextField("", text: $viewModel.searchedText)
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .placeholder(when: viewModel.searchedText.isEmpty) {
                                Text("Search")
                                    .foregroundColor(.gray)
                                    .font(.inter(.regular, size: 18))
                            }
                            .padding()
                            .padding(.leading, 30)
                            .frame(height: 40)
                            .background(grayColor)
                            .cornerRadius(20)
                            .padding()
                            .disableAutocorrection(true)
                        
                        HStack {
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20,height: 20)
                                .foregroundColor(.gray)
                                .padding(.leading, 30)
                            
                            Spacer()
                            
                            Button(action: {
                                    viewModel.searchedText = ""
                            }) {
                                
                                ZStack{
                                    
                                    Circle()
                                        .fill(.gray)
                                        .frame(width: 24,height: 24)
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
                            .opacity(viewModel.searchedText.isEmpty ? 0 : 1)
                        }
                        .padding(.trailing,30)
                        }
                }
                
                if !viewModel.searchArray.isEmpty {
                    ScrollView(showsIndicators:false) {
                        ForEach(Array(stride(from: 0, to: viewModel.searchArray.count, by: 2)),id: \.self) { no in
                            
                            let first = viewModel.searchArray[no]
                            HStack(spacing: 30){

                                NavigationLink(destination:Item(
                                    itemType: first.category,
                                    name: first.name,
                                    image: first.image,
                                    price: first.price,
                                    text: first.description
                                )
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                                ) {
                                    FoodCardView(
                                        name: first.name,
                                        image: first.image,
                                        price: first.price
                                    )
                                }
                                
                                
                                if no+1 < viewModel.searchArray.count {
                                    
                                    let second = viewModel.searchArray[no+1]
                                
                                    NavigationLink(destination:Item(
                                        itemType: second.category,
                                        name: second.name,
                                        image: second.image,
                                        price: second.price,
                                        text: second.description
                                    )
                                        .navigationBarHidden(true)
                                        .navigationBarTitle("")
                                    ) {
                                        FoodCardView(
                                            name: second.name,
                                            image: second.image,
                                            price: second.price
                                        )
                                    }
                                }
                            }
                        }
                        
                    }
                } else {
                    VStack {
                        Text("No food found")
                            .foregroundColor(.gray)
                            .font(.inter(.extraLight, size: 32))
                    }
                    .frame(maxHeight: .infinity)
                }
                
                
                    
                
                Spacer()
            }
            .ignoresSafeArea(edges:.bottom)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            
            
            
        }
    }    
}

struct Search_Preview:PreviewProvider{
    static var previews: some View{
        NavigationView {
            SearchView()
                .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
            .navigationBarHidden(true)
        }
    }
}
    
