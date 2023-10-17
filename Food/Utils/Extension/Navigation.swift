//
//  Navigationm.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import SwiftUI


extension UINavigationController {
    override open func viewDidLoad() {
        withAnimation(.default){
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
        self.navigationItem.setHidesBackButton(false, animated: true)
        }
    }
}

//extension View {
//    func hideKeyboard() {
//        let resign = #selector(UIResponder.resignFirstResponder)
//        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
//    }
//}
