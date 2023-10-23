//
//  SignOutView.swift
//  Food
//
//  Created by mishu on 09.05.2022.
//

import SwiftUI


struct SignOutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            backgroundWhite.ignoresSafeArea()
            
            VStack {
                HStack {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .foregroundColor(blackJetColor)
                        .frame(width: 30)
                        .padding()
                        .onTapGesture{ dismiss() }
                    
                    Spacer()
                }
                
                Spacer()
                
                Text("SignOutView screen")
                    .font(.inter(.extraLight, size: 16))
                
                Spacer()
            }
            
        }
    }
}

struct SignOut_Preview: PreviewProvider{
    static var previews: some View{
        SignOutView()
    }
}
