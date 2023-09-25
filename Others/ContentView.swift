////
////  ContentView.swift
////  Food
////
////  Created by mishu on 03.05.2022.
////
//
//import SwiftUI
//
//
//
//struct ContentView: View {
//    
//    @State var selected = 0
//    @State var item = 0
//    @State var isShown = true
//    @Environment(\.dismiss) var dismiss
//  
//    
//    var body: some View {
//        
//        VStack {
//            ZStack{
//                switch selected{
//                case 0:
//                    ZStack{
//                        switch item{
//                            case 0:
//                            Button(action: {item=1;isShown.toggle()}){
//                                Text("Button")
//                                    .font(.custom("Inter-Bold", size: 40))
//                                }
//                            case 1:
//                            Button(action: {item=0;isShown.toggle()}){
//                                Text("Back")
//                            }
//                            
//                        default:
//                            Text("Hello")
//                            
//                            
//                        }
//                    }
//                case 1:
//                    Text("Second")
//                case 2:
//                    Text("Third")
//                    
//                default:
//                    Text("Other")
//                }
//            }
//            
//            Spacer()
//            
//            if isShown{
//                HStack(){
//                    
//                    ForEach(0..<4){num in
//                        Button(action: {selected=num}, label: {Text("\(num)").font(.title)})
//                            .foregroundColor(.white)
//                            .padding([.leading,.trailing],30)
//                    }
//                                                
//                }
//            
//                .padding()
//                .frame(maxWidth:.infinity)
//                .background(.pink)
//            .ignoresSafeArea()
//            }
//        
//        }
//        
//        
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
//    }
//}
