//
//  AccountViewModel.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import Foundation


class AccountViewModel : ObservableObject {
    
    static var initialize = AccountViewModel()
    
    
    @Published var showRegisterScreen = false
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var phoneNumber = ""
    @Published var confirmPassword = ""
    @Published var address = ""
    
    @Published var showEditScreen = false
    @Published var editType = EditType.none
    
    @Published var editTextValue =  ""
    
    func save() {
        
    }
    
    
    
    
}
