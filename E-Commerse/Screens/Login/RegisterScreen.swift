//
//  RegisterScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import Foundation
import SwiftUI

struct RegisterScreen : View {
    
    let networkManager = NetworkManager()
    
    
    @StateObject var viewModel = LoginViewModel.initialize

    var body: some View {
        NavigationStack {
            ZStack {
                LazyVStack {
                    CustomInputTextField(textFieldTitle: "Full Name", textValue: $viewModel.fullName)
                    CustomInputTextField(textFieldTitle: "Email", textValue: $viewModel.email)
                    CustomInputTextField(textFieldTitle: "Phone Number", textValue: $viewModel.phoneNumber)
                    CustomInputTextField(textFieldTitle: "Current Address", textValue: $viewModel.address)
                    CustomInputTextField(textFieldTitle: "Password", textValue: $viewModel.password, isSecuredField: true)
                    CustomInputTextField(textFieldTitle: "Confirm Password", textValue: $viewModel.confirmPassword, isSecuredField: true)
                   
                    
                    
                    Button{
                      
                            viewModel.registerUser()
                        
                    }label: {
                        Text("Register")
                    }
                    .frame(width: 300, height : 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    Button{
                        
                        viewModel.showRegisterScreen = false
                    }label: {
                        Text("Cancel")
                    }
                    .frame(width: 300, height : 50)
                    .background(.black.opacity(0.05))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                }
                
                
                
            }
            .navigationTitle("Register")

            
        }
    }
}


#Preview {
    RegisterScreen()
}

