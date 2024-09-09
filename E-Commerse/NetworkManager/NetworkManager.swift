//
//  NetworkManager.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import Foundation


class NetworkManager {
    
    func getTokenFromKeyChain () -> String? {
        if let retrievedData = KeyChainHelper.retrieveData(forService: "com.pranish.E-Commerse", account: "Token") {
            // Use the retrieved data
            if let tokenString = String(data: retrievedData, encoding: .utf8) {
                print("Retrieved token: \(tokenString)")
                return tokenString
            } else {
                print("Failed to convert data to string")
            }
        } else {
            print("No data found in Keychain")
        }

        return nil
    }

    
    // get all cakes
    
    func fetchAllCakes () async -> [Cake]
    {
        
        
        let uri = "/cake/getAllCakes"
        let completeUrl = "\(Const.backendBaseURL)\(uri)"
        
        guard let safeUrl = URL(string: completeUrl) else {
            print("Unable to get a safe Url")
            return []
        }
        
        // Create URLRequest
        var request = URLRequest(url: safeUrl)
        request.httpMethod = "GET"

        guard let token = getTokenFromKeyChain() else {
            
            return []
        }
        
        let bearerToken = token
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "authorization")

        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpReponse = response as? HTTPURLResponse, httpReponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(CakeApiResponse.self, from: data)
            return apiResponse.data
            
    
            
        }catch {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    
    func registereUser(fullName : String, email : String, password : String, address : String, phoneNumber : String) async  -> Bool{
        
        let uri = "/user/register"
        let completeUrl = "\(Const.backendBaseURL)\(uri)"
        
        guard let safeUrl = URL(string: completeUrl) else {
            print("Unable to get Safe Url")
            return false
        }
        
        var request = URLRequest(url: safeUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  // Set content type

        
        let user = User(fullName: fullName, password: password, email: email, phoneNumber: phoneNumber, address: address)
        print(user)
        // converting data into JSON data
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            
        }catch let error {
            print(error)
            return false
        }
        
        do {
            
        // creating URLSession data task
            let (data, response) = try await URLSession.shared.data(for: request)
            print(data)
            print(".....")
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            // decode the response
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any]{
                print("Response JSON : \(json)")
            }
            else {
                print(user)
                print(data)
                print("Failed to decode")
            }
            return true
            
        }catch {
            print("Request failed with error: \(error.localizedDescription)")
            return false

        }
    }
    
    

    
    func loginUser(email: String, password : String) async -> Result<Bool, LoginError>{
        
        let service  = "com.pranish.E-Commerse"
        let account = "Token"
        
        let uri = "/user/login"
        let completeUrl = "\(Const.backendBaseURL)\(uri)"
        
        guard let safeUrl = URL(string: completeUrl) else {
            print("Invalid Url")
            return .failure(.networkConnection)
        }
        
        // creating a request
        
        var request = URLRequest(url: safeUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let user = LoginUser(email: email, password: password)
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            
        }catch {
            print(error)
            return .failure(.parsingErro)
        }
        
        
        // creating url session task
        do {
            let ( data, response ) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            // decode the response
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any], let data = json["data"] as? [String: Any],
                let token = data["refreshToken"] as? String {
                let refreshToken = token.data(using: .utf8)!
                
                if KeyChainHelper.storeData(data: refreshToken, forService: service, account: account) {
                    print("Data stored in Keychain ")
                }
                else {
                    print("Failed to store in keychain")
//                    return .failure(.keyChainError)
                }

            }
            else {
                print(user)
                print(data)
                print("Failed to decode")
                return .failure(.parsingErro)

            }
            
            
        }catch {
            print(error)
            return .failure(.networkConnection)

        }
        return .success(true)
    }
    
}



