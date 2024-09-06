//
//  HomeScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI

struct HomeScreen : View {

    @State var cakeList : [Cake] = []
    
    var body: some View {
        NavigationStack{
            List{
                
                ForEach( cakeList, id: \._id ) { cake in
                    NavigationLink(destination: DetailScreen(cake: cake)){
                    HStack{
                        Text(cake.displayName)
                            .font(.title)
                        Spacer()
                        Text(String(cake.price))
                    }
                    }
                    
                }
                .navigationTitle("Home")
                
            }
        }

        .onAppear{
            Task {
                let manager = NetworkManager()
                await cakeList = manager.fetchAllCakes()
                
            }
        }
    }
}


