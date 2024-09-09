//
//  LoginScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI

struct LoginScreen : View {
    @State private var successfullLogin = false
    
    @StateObject var viewModel = LoginViewModel.initialize
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                VStack {
                    
                    CustomInputTextField(textFieldTitle: "Email", textValue: $viewModel.loginEmail)
                    CustomInputTextField(textFieldTitle: "Password", textValue: $viewModel.loginPassword, isSecuredField: true)
                    
                    Button {
                        viewModel.loginUser()
                    } label: {
                        Text("Login")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button {
                        viewModel.showRegisterScreen = true
                    } label: {
                        Text("Register")
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                }
                
                
                NavigationLink(
                    destination: TabScreen(),  // Replace with your destination view
                    isActive: $viewModel.loginSuccessStatus
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Login")
        }
        .sheet(isPresented: $viewModel.showRegisterScreen, content: {
            RegisterScreen()
        })
    }
    
}


#Preview {
    LoginScreen();
}
