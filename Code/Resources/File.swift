//
//  File.swift
//  Food
//
//  Created by mishu on 03.05.2022.
//

import SwiftUI

let backgroundWhite = Color.init(red: 0.96, green: 0.96, blue: 0.96)
let backgroundBlack = Color.init(red: 0.07, green: 0.07, blue: 0.07)
let grayColor = Color.init(red: 0.88, green: 0.88, blue: 0.88)
let grayBackground = Color.init(red: 0.90, green: 0.90, blue: 0.90)
let blackJetColor = Color.init(red: 0.05, green: 0.05, blue: 0.06)
let greenColor = Color.init(red: 0.20, green: 0.64, blue: 0.12)


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
