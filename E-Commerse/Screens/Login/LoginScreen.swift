//
//  LoginScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import SwiftUI

struct LoginScreen : View {
    
    @State var email = ""
    @State var password  = ""
    
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var successfullLogin = false
    @State private var showRegisterScreen = false



    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                                    
                VStack {
                    
                        TextField("Email", text: $email)
                        .padding()
                            .disableAutocorrection(true)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongEmail))
                        
                        SecureField("Password", text: $password)
                        .padding()
                        .disableAutocorrection(true)
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                        
                        
                        
                        
                        Button {
                            
                        } label: {
                            Text("Login")
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                    Button {
                        showRegisterScreen = true
                    } label: {
                        Text("Register")
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    

                    
                }
            }
            .navigationTitle("Login")
        }
        .sheet(isPresented: $showRegisterScreen, content: {
            RegisterScreen(showingRegister: $showRegisterScreen)
        })
    }
    
}


#Preview {
    LoginScreen(email: "", password: "");
}
