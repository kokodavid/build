//
//  Authentication.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/26/21.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    @Published var isStatus = false
    @Published var isCode = false
    @Published var isReset = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
            case invalidCredentials
            
            var id: String {
                self.localizedDescription
            }
            
            var errorDescription: String? {
                switch self {
                case .invalidCredentials:
                    return NSLocalizedString("Either your email or password are incorrect. Please try again", comment: "")
                }
            }
        }
    
    enum RegistrationError: Error, LocalizedError, Identifiable{
        case invalidPhone

        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidPhone :
                return NSLocalizedString("Invalid phone number", comment: "")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    enum PasswordError: Error, LocalizedError, Identifiable{
        case invalidPass
        case invalidCode
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String?{
            switch self {
            case .invalidPass:
                return NSLocalizedString("Invalid Password, password should be 8 characters long and have atleast a number", comment: "")
                
            case .invalidCode:
                return NSLocalizedString("Invalid code, enter latest code received as SMS", comment: "")
            }
        }
    }
    func updateValidation(success: Bool){
        withAnimation{
            isValidated = success
        }
    }
    
    func updateStatus(status: Bool){
        withAnimation{
            isStatus = status
            
        }
    }
    
    func updateCode(code: Bool){
        withAnimation{
            isCode = code
        }
    }
}
