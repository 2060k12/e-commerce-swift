//
//  NetworkManager.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 4/9/2024.
//

import Foundation


class NetworkManager {
    
    
    // get all cakes
    
    func fetchAllCakes () async -> [Cake]
    {
        let uri = "/cake/getAllCakes"
        let completeUrl = "\(Const.backendBaseURL)\(uri)"
        
        guard let safeUrl = URL(string: completeUrl) else {
            print("Unable to get a safe Url")
            return []
        }
        
        
        do {
            let (data, response) = try await URLSession.shared.data(from: safeUrl)
            
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
    
    

    
    
    
    
}
