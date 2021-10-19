//
//  RegisterViewModel.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 8/5/21.
//

import Foundation

class RegisterViewModel: ObservableObject{
    @Published var phoneNumber: String = ""
    @Published var code: String = ""
    @Published var showProgressView = false
    
    
    var regDisabled: Bool {
        phoneNumber.isEmpty
    }
    
    func checkRegStatus(completion: @escaping (Bool) -> Void ){
        showProgressView = true
        completion(true)
        showProgressView = false
        APIService.shared.regStatus(phone: phoneNumber){ [unowned self] (result: Result<Bool, Authentication.RegistrationError>) in
            showProgressView = false
            print("result>>> \(result)")
            switch result{
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func checkCode(completion: @escaping (Bool) -> Void){
        showProgressView = true
        APIService.shared.checkCode(phone: phoneNumber, code: code){ [unowned self] (result: Result<Bool, Authentication.PasswordError>) in
            
            print("result>>> \(result)")
            switch result{
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
