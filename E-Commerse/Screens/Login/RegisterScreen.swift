//
//  RegisterScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import Foundation
import SwiftUI

struct RegisterScreen : View {
    @Binding var showingRegister : Bool
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var phoneNumber = ""
    @State var confirmPassword = ""
    @State var address = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LazyVStack {
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .frame(width : 300, height : 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width : 300, height : 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .frame(width : 300, height : 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width : 300, height : 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .frame(width : 300, height : 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    
                    Button{
                        
                    }label: {
                        Text("Register")
                    }
                    .frame(width: 300, height : 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    Button{
                        showingRegister = false
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
    RegisterScreen(showingRegister: .constant(true))
}
