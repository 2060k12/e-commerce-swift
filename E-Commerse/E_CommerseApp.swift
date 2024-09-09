//
//  E_CommerseApp.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI

@main
struct E_CommerseApp: App {
    var cart = Cart()
    
    var body: some Scene {
        WindowGroup {
          LoginScreen().environmentObject(cart)
//        TabScreen().environmentObject(cart)
        }
    }
}
