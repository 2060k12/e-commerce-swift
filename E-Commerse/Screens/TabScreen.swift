//
//  Tab.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI


struct TabScreen : View {
    @EnvironmentObject var cart : Cart
    var body: some View {
        TabView {
            
            HomeScreen()
                .tabItem {
                               Image(systemName: "house.fill")
                               Text("Home")
                           }
            
            CartScreen()
                .tabItem {
                               Image(systemName: "cart")
                               Text("Cart")
                           }
                .badge(cart.listOfCart
                    .count)
            
            AccountScreen()
                .tabItem {
                               Image(systemName: "person")
                               Text("Profile")
                           }
            
             
        }
    }
}
