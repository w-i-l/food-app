//
//  Account.swift
//  Food
//
//  Created by mishu on 06.05.2022.
//

import SwiftUI

struct Account:View{
    
    @EnvironmentObject var storage:Storage
    
    let email:String
    let profilePicture:String
    
    let categories = ["Order history","Personal data","Vouchers","F.A.Q.","Sign Out"]
    
    var body:some View{
        
        NavigationView {
            ZStack {
                
                backgroundWhite.ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Text("Account")
                            .foregroundColor(blackJetColor)
                            .font(.system(size:36))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                    
                    HStack(spacing:40){
                        
                        Text(email)
                            .foregroundColor(.gray)
                            .font(.system(size:18))
                            .fontWeight(.light)
                        
                        Image(systemName:profilePicture)
                            
                            .resizable()
                            .foregroundColor(blackJetColor)
                            .aspectRatio(contentMode: .fit)
                            
                            .frame(width:85,height:85)
                            
                    }
                    .padding(.top,-40)
                    
                    Divider()
                        .padding([.leading,.trailing],20)
                    
                    VStack(spacing:35){
                        ForEach(categories,id:\.self){item in
                            HStack {
                                Text(item)
                                    .foregroundColor(blackJetColor)
                                    .font(.system(size:20))
                                .fontWeight(.regular)
                                .padding(.leading,40)
                                
                                Spacer()
                                
                                NavigationLink(destination:PersonalData().navigationBarHidden(true)) {
                                    Image(systemName:"arrow.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(blackJetColor)
                                        .frame(width: 24, height: 24)
                                    .padding(.trailing,40)
                                }
                            }
                            Divider()
                                .padding([.leading,.trailing],20)
                        }
                    }
                    .padding()
                    .padding(.top,70)
                    
                    Spacer()
                }
                
            }
            .navigationBarHidden(true)
        }
        
        
        
    }
    
    init(email:String = "mast***@gmail.com",profilePicture:String = "person.crop.circle"){
        self.email = email
        self.profilePicture = profilePicture
    }
    
}

struct Account_Preview:PreviewProvider{
    static var previews:some View{
        Account()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
