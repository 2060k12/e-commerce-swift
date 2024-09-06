//
//  Users.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import Foundation


struct User : Codable {
    var fullName : String
    var password : String
    var email : String
    var phoneNumber : String
    var address : String

}

struct UserResponse : Decodable {
    var data : [User]
}


