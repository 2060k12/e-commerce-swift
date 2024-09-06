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
    
    
    func registereUser(userName : String, email : String, password : String, address : String, phoneNumber : String) {
        
        let uri = "/user/register"
        let completeUrl = "\(Const.backendBaseURL)\(uri)"
        
        guard let safeUrl = URL(string: completeUrl) else {
            print("Unable to get Safe Url")
            return
        }
        
        
    }
    
    

    
    
    
    
}
