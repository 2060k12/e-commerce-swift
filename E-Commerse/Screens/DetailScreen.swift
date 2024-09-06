//
//  DetailScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import SwiftUI

struct DetailScreen : View {
    let cake : Cake
    @EnvironmentObject var cart : Cart

    var body: some View {
        guard let safeUrl = URL(string: cake.imageUrl ?? "https://images.unsplash.com/photo-1642443162669-b0ea91a3f09b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNha2VzfGVufDB8fDB8fHww") else {
                  // Return a placeholder or error view if the URL is invalid
                  return AnyView(Text("Invalid Image URL"))
              }
        
        return AnyView(
            NavigationStack{
                VStack(alignment :.leading) {
                    AsyncImage(url: safeUrl) {
                        image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fill)
                            
                            
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                   
                
                    Text(cake.displayName)
                            .font(.title)
                            .bold()
                    
                    Text("$ \(cake.price, specifier: "%.2f")")
                        .font(.title)
                        .bold()
                        
                           
                    if let description = cake.description {
                        Text(description)
                    }
                    
                    Spacer()
                    
                    FilledButton(label: "Add To Cart") {
                        cart.appendCart(newItem: cake)
                    }
                    
                }
                .safeAreaPadding()
                .toolbar(.hidden, for: .tabBar)
                
          

                
                
                
            }
                
        )
        
    }
}



