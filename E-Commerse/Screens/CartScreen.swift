//
//  CartScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var cart : Cart
    
    var body: some View {
        NavigationStack {
            
            if(cart.listOfCart.count == 0) {
                
                VStack {
                    Image(systemName: "list.clipboard.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        
                    
                  
                        Text("Your cart is empty")
                    .font(.title2)
                    .bold()
                        
                }
            }
            else {
                
                VStack(alignment : .leading) {
                    List {
                    ForEach(cart.listOfCart, id: \._id) { item in
                        
                            HStack( spacing : 20){
                                if let url = item.imageUrl, let safeUrl = URL(string: url) {
                                    AsyncImage(url: safeUrl){
                                        image in
                                        image.image?.resizable()
                                            .resizable()
                                            .frame(width: 100, height: 80)
                                        
                                            .aspectRatio(contentMode: .fit)
                                            .clipped()
                                    }
                                    .cornerRadius(10)
                                }
                                
                                VStack (alignment: .leading) {
                                    Text(item.displayName)
                                        .font(.headline)
                                        .bold()
                                    Text(String("$ \(item.price)"))
                                }
                            }
                            
                        }
                    .onDelete(perform: { indexSet in
                        cart.deleteItem(removeAt: indexSet)
                    })
                    }
                    Spacer()
                    FilledButton(label: "CheckOut") {
                        // todo :: Checkout feature
                    }.padding()
                }
                .navigationTitle("Cart")
                .padding(.bottom)
            }
        }
    }
    
}
