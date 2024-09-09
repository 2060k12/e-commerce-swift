//
//  KeyChainHelper.swift
//  E-Commerse
//
//  Created by Pranish Pathak on 9/9/2024.
//

import Foundation

import Security

class KeyChainHelper {
    
    static func storeData(data : Data, forService service : String, account : String) -> Bool {
        
        let query : [String : Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrService as String : service,
            kSecAttrAccount as String : account,
            kSecValueData as String : data
        
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
        
    }
    
    static func retrieveData(forService service: String, account: String) -> Data? {
           let query: [String: Any] = [
               kSecClass as String: kSecClassGenericPassword,
               kSecAttrService as String: service,
               kSecAttrAccount as String: account,
               kSecReturnData as String: kCFBooleanTrue!,
               kSecMatchLimit as String: kSecMatchLimitOne
           ]
           
           var dataTypeRef: CFTypeRef?
           let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
           
           guard status == errSecSuccess else {
               print("Failed to retrieve data from Keychain: \(status)")
               return nil
           }
           
           return dataTypeRef as? Data
       }
    
}
