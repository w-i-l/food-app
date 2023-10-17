//
//  Environments.swift
//  Food
//
//  Created by Mihai Ocnaru on 17.10.2023.
//

import SwiftUI

@available(iOS 14.0, *)
extension EnvironmentValues {
    var dismiss: () -> Void {
        { presentationMode.wrappedValue.dismiss() }
    }
}
