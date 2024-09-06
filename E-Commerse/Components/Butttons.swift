//
//  Butttons.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import SwiftUI


/// Filled Button
///
/// This button requires two parameters:
/// - `label`: This is the text that will be shown inside the button.
/// - `onClick`: This variable is a function that defines what the button does.

struct FilledButton: View {
    
    var label : String
    var onClick : () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(label)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .frame( height: 50)
    
    }
}

