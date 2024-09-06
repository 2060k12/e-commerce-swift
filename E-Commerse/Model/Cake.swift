//
//  Cake.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import Foundation


struct Cake : Codable {
    var _id : String
    var displayName: String
    var imageUrl: String
    var price: Float
    var createdAt: String
    var updatedAt: String
    var __v : Int
}


struct CakeApiResponse : Codable {
    let data : [Cake]
}
