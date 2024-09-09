//
//  LoginError.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 9/9/2024.
//

import Foundation

enum LoginError : Error {
    
    case invalidCredentials
    case networkConnection
    case apiError
    case parsingErro
    case keyChainError
    case unknown
    
}


