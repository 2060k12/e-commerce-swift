//
//  LoginViewModel.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 6/9/2024.
//

import Foundation

/// `LoginViewModel` handles the data and logic required for login and registration tasks.
/// 
/// It follows the singleton pattern to ensure a single shared instance for consistent data management
/// between login and registration screens.
class LoginViewModel : ObservableObject {
    
    /// Singleton instance of `LoginViewModel` to provide a single shared instance across the app.
    static var initialize = LoginViewModel()

    let networkManager = NetworkManager()
    
    // MARK: - Registration Screen Properties
    @Published var showRegisterScreen = false
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var phoneNumber = ""
    @Published var confirmPassword = ""
    @Published var address = ""
    
    
    
    
    // MARK: - Login Screen Properties
    @Published var loginEmail = ""
    @Published var loginPassword  = ""
    @Published var loginSuccessStatus = false
    @Published var loginError : LoginError?
    
 
    /// Registers the user with the input data.
    /// Uses the `networkManager` to send registration data and updates the state upon success.
    func registerUser() {
        Task {
            if(await networkManager.registereUser(
                fullName: fullName,
                email: email,
                password: password,
                address: address,
                phoneNumber: phoneNumber
            )) {
                DispatchQueue.main.async {
                    self.loginEmail = self.email
                    self.showRegisterScreen = false
                }
            }
        }
        
    }
    
    
    func loginUser()  {
        Task {
            switch (await networkManager.loginUser(email: loginEmail , password: loginPassword)) {
            case .success(let success):
                if(success) {
                    DispatchQueue.main.async {
                        self.loginSuccessStatus = true }
                    }
                else {
                    DispatchQueue.main.async {
                        self.loginSuccessStatus = false
                        self.loginError = .unknown
                        
                    }
                }
                
               
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.loginSuccessStatus = false
                    self.loginError = error
                }
                    
            }
            
        }
    }
    
}
