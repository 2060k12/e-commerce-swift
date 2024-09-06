//
//  TextFields.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import Foundation
import SwiftUI

/// Custom text field, which also supports secured typer fields for Passwords or a normal Fields
struct CustomInputTextField: View {
    
    var textFieldTitle : String
    @Binding var textValue : String
    var isSecuredField = false
    
  
    var body: some View {
        
        if(!isSecuredField) {
            TextField(textFieldTitle, text: $textValue)
                .padding()
                .frame(width : (UIScreen.main.bounds.width - 32), height : 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                
            
        }
        else {
            SecureField(textFieldTitle, text: $textValue)
                .padding()
                .frame(width : (UIScreen.main.bounds.width - 32), height : 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
        }
    }
}


#Preview {
    CustomInputTextField(textFieldTitle: "Demo", textValue: .constant(""))
}
