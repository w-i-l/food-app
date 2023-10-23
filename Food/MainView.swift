//
//  MainView.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var isShowingNavBar = false
    @State private var selected = 0
    
    private let iconsArray = ["house","safari","cart","person"]
    
    var body: some View {
        ZStack {
            
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                ZStack {
                    HomeView()
                        .opacity(selected == 0 ? 1 : 0)
                    
                    ExploreView()
                        .opacity(selected == 1 ? 1 : 0)
                    
                    CartView()
                        .opacity(selected == 2 ? 1 : 0)
                    
                    AccountView()
                        .opacity(selected == 3 ? 1 : 0)
                }
                
                Spacer()
                
                //                if !isShowingNavBar {
                HStack(spacing: UIScreen.main.bounds.width / 6) {
                    ForEach(0..<4) { num in
                        Button(action: {
                            selected = num
                        }) {
                            Image(systemName: iconsArray[num])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:selected == num ? 50 : 30)
                                .foregroundColor(selected == num ? blackJetColor : Color.init(red: 0.7, green: 0.7, blue: 0.7))
                                .padding(0)
                                .animation(.easeInOut(duration: 0.2))
                        }
                    }
                }
                .padding(10)
                .padding(.bottom, 5)
                .frame(height: 55)
                .transition(.move(edge: .bottom).combined(with: .opacity).animation(.easeInOut(duration: 0.05)))
                .clipped()
                .ignoresSafeArea(.keyboard, edges: .all)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct APP_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
