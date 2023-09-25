//import SwiftUI
//
//class Storage: ObservableObject {
//    @Published var quantityArray:[FoodItem:Int] = [:]
//}
//struct First:View{
//    @State var name = 0
//    var body: some View{
//        VStack{
//            Text("\(name)")
//            Second(name: $name)
//        }
//    }
//}
//
//struct Second:View{
//    @Binding var name:Int
//    var body: some View{
//        VStack {
//            Button(action: {name+=1 }, label: {Text("change")})
//            Third(name: $name)
//        }
//    }
//}
//
//struct Third:View{
//    @Binding var name :Int
//    var body: some View{
//        Button(action: {name -= 1 }, label: {Text("always 1")})
//    }
//}
//
//struct Preview:PreviewProvider{
//    static var previews: some View{
//        First()
//
//        
//    }
//}
