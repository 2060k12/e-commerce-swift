//
//  Cart.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import Foundation
class Cart : ObservableObject {
    @Published var listOfCart : [Cake] = []
    
    func appendCart(newItem : Cake) {
        listOfCart.append(newItem)
    }
    
    func deleteItem (removeAt : IndexSet) {
        print(removeAt.count)
        print(removeAt)
        removeAt.forEach { index in
            listOfCart.remove(at: index)
        }
//        listOfCart.remove(at: removeAt.count )
    }
    
}
