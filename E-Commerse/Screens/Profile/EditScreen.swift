//
//  EditScreen.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import SwiftUI

struct EditScreen: View {
    @StateObject var viewModel = AccountViewModel.initialize
    
    var body: some View {
        
        
        VStack {
            
            HStack {
                Button {
                    viewModel.showEditScreen = false
                }label: {
                    Text("Cancel")
                }
                Spacer()
                Button {
                    
                }label: {
                    Text("Done")
                }
            }
            .padding(20)
            
            
            switch (viewModel.editType) {
                
            case .fullName :
                VStack {
                    editTextTitle(title: "Full Name")
                    CustomInputTextField(textFieldTitle: "Enter your name here" , textValue: $viewModel.editTextValue)
                }
                
            case .password:
                editTextTitle(title: "Update Password")
                CustomInputTextField(textFieldTitle: "Old Password" , textValue: $viewModel.editTextValue, isSecuredField: true)
                CustomInputTextField(textFieldTitle: "New Password" , textValue: $viewModel.editTextValue, isSecuredField: true)
                CustomInputTextField(textFieldTitle: "Confirm New Password" , textValue: $viewModel.editTextValue, isSecuredField: true)
                
            case .email:
                editTextTitle(title: "Update Email")

                CustomInputTextField(textFieldTitle: "Email" , textValue: $viewModel.editTextValue)
                
            case .address:
                editTextTitle(title: "Update Your Address")
                CustomInputTextField(textFieldTitle: "Address" , textValue: $viewModel.editTextValue)
                
            case .profileImage:
                editTextTitle(title: "Update Profile Image")
                CustomInputTextField(textFieldTitle: "Image Url" , textValue: $viewModel.editTextValue)
                
            case .none:
                EmptyView()
            }
            Spacer()
            
        }
     
        
    }
}

#Preview {
    EditScreen()
}


enum EditType {
    case fullName
    case password
    case email
    case profileImage
    case address
    case none
    
}


struct editTextTitle : View {
    var title : String
    var body: some View {
        Text(title)
            .font(.title)
            .bold()
    }
}
