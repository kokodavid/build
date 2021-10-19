//
//  APIService.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/26/21.
//

import Foundation
class APIService{
    static let shared = APIService()
    var BASE_URL: String = "https://api.eduweb.co.ke/"
    enum APIError: Error {
        case error
    }
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool,Authentication.AuthenticationError>)->Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            
            let params: [String: String] = [
                "user_name": credentials.user_name,
                "user_pwd":credentials.user_pwd,
                "device_user_id":credentials.device_user_id
            ]
            //call api
            let url = URL(string: "\(self.BASE_URL)parentLogin")
            
            var request = URLRequest(url: url!)
            
            request.httpMethod = "POST"
            
            let jsonData = AuthManager().getPostString(params: params)
            
            request.httpBody = jsonData.data(using: .utf8)
            
            
            print("request---> \(String(describing: request))")
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                (data, response, error) in
                //error
                if let error = error {
                    print("Error accessing eduweb.api: \(error)")
                    completion(.failure(.invalidCredentials))
                    return
                    
                }
                
                //response
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                //data
                if let data = data ,
                   let userResponse = try? JSONDecoder().decode(LoginResponse.self, from: data){
                    print("dataREsponse---> \(userResponse)")
                    completion(.success(true))
                    DispatchQueue.main.async {
                        completion(.success(true))
                    }
                    
                }
            })
            
            task.resume()        }
        
    }
    
    func regStatus(phone: String, completion: @escaping (Result<Bool,Authentication.RegistrationError>)->Void) {
        
        //call api
        let url = URL(string: "\(self.BASE_URL)registrationStatus/\(phone)")
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print("regError--->\(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                completion(.failure(.invalidPhone))
                return
            }
            
            if let data = data,
               let registrationResponse = try? JSONDecoder().decode(Response.self, from: data){
                print("regResponse---> \(registrationResponse)")
                if  registrationResponse.message == "success" {
                    completion(.success(true))
                    DispatchQueue.main.async {
                        completion(.success(true))
                    }
                }
                
            }
        }
        
        task.resume() }
    
    
    
    
}
