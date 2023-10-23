//
//  AccountView.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

enum AccountScreens: String, CaseIterable {
    case orderHisstory = "Order history"
    case personalData = "Personal data"
    case vouchers = "VouchersView"
    case faq = "F.A.Q"
    case signOut = "Sign Out"
}

struct AccountView: View {
    
    let email: String
    let profilePicture: String
    
    private let screens: [(enumScreen: AccountScreens, screen: AnyView)] = [
            (AccountScreens.orderHisstory, AnyView(OrderHistoryView())),
            (AccountScreens.personalData, AnyView(PersonalDataView())),
            (AccountScreens.vouchers, AnyView(VouchersView())),
            (AccountScreens.faq, AnyView(FAQView())),
            (AccountScreens.signOut, AnyView(SignOutView()))
        ]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                backgroundWhite.ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Text("AccountView")
                            .foregroundColor(blackJetColor)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                    
                    HStack(spacing: 40) {
                        
                        Text(email)
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .fontWeight(.light)
                        
                        Image(systemName: profilePicture)
                            
                            .resizable()
                            .foregroundColor(blackJetColor)
                            .aspectRatio(contentMode: .fit)
                            
                            .frame(width: 85, height: 85)
                            
                    }
                    .padding(.top, -40)
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    VStack(spacing: 35) {
                        ForEach(screens, id: \.enumScreen) { enumScreen, screen in
                            HStack {
                                Text(enumScreen.rawValue)
                                    .foregroundColor(blackJetColor)
                                    .font(.system(size: 20))
                                .fontWeight(.regular)
                                .padding(.leading, 40)
                                
                                Spacer()
                                
                                NavigationLink(destination: screen.navigationBarHidden(true)) {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(blackJetColor)
                                        .frame(width: 24, height: 24)
                                    .padding(.trailing, 40)
                                }
                            }
                            Divider()
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding()
                    .padding(.top, 70)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    init(
        email: String = "mast***@gmail.com",
        profilePicture: String = "person.crop.circle"
    ){
        self.email = email
        self.profilePicture = profilePicture
    }
    
}

struct Account_Preview:PreviewProvider{
    static var previews:some View{
        AccountView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
