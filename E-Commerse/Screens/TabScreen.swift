//
//  Tab.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI


struct TabScreen : View {
    var body: some View {
        TabView {
            
            HomeScreen()
                .tabItem {
                               Image(systemName: "house.fill")
                               Text("Home")
                           }
            
            HomeScreen()
                .tabItem {
                               Image(systemName: "cart")
                               Text("Cart")
                           }
            
            HomeScreen()
                .tabItem {
                               Image(systemName: "person")
                               Text("Profile")
                           }
            
             
        }
    }
}
