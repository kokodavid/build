//
//  AuthManager.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 21/06/2021.
//

import Foundation

class AuthManager: ObservableObject {
    
    @Published var students : [Student] = []
    @Published var isBusy : Bool = false
    @Published var isUser: Bool = false
    @Published var isError = false
    var BASE_URL:String = "https://api.eduweb.co.ke/"
    
    
    
    init() {
    
    }
    
    //login
    func loginUser(username: String, password: String){
        self.isBusy = true
        //auth Url call
        //auth string param
        if username.isEmpty && password.isEmpty {
            self.isBusy = false
            self.isError = true
        }
        let loginObject: [String: String] = [
            "user_name": username,
            "user_pwd":password,
            "device_user_id":""
        ]
        
        authCall(params: loginObject){(LoginResponse) in
            if LoginResponse.response != "Success" {
                self.isBusy = false
                self.isError = true
            }
            let response = LoginResponse.response
            print(LoginResponse.data)
            self.isBusy = false
            if response == "Success" {
                DispatchQueue.main.async{
                    print("response from login -->> \(response)")
                    
                    self.isUser = true
                    self.students = (LoginResponse.data.students)
                }
                
            }
        }
        
        
    }
    
    //login
    func authCall(params: [String:String],completion: @escaping ((LoginResponse))-> Void) {
        
        //call api
        let url = URL(string: "\(BASE_URL)parentLogin")
        
        var request = URLRequest(url: url!)
//        request.setValue("application/form-data", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let jsonData = AuthManager().getPostString(params: params)

        request.httpBody = jsonData.data(using: .utf8)
        
        print("request---> \(request)")
        print("request---> \(String(describing: request))")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            //error
            if let error = error {
                print("Error accessing eduweb.api: \(error)")
                return
            }
            
            //response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            //data
            if let data = data ,
               let userResponse = try? JSONDecoder().decode(LoginResponse.self, from: data){
                print("dataREsponse---> \(userResponse)")
                DispatchQueue.main.async {
                    completion(userResponse)
                }
                
            }
        })
        
        task.resume()
    }
    
    
    //register password
    func registerPass(phone:String, pass: String){
        let regObject : [String: String] = [
            "user_phone":phone,
            "user_pwd":pass
        ]
    }
    
    
    //remember me
    func saveToken(username: String, password: String){
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "username")
        defaults.set(password,forKey: "password")
    }
    
    //check token
    func isLoggedIn()-> Bool {
        
        if students.isEmpty {
            return false
        }
        return true
//        let defaults = UserDefaults.standard
//        if defaults.string(forKey: "username") != nil  {
//            return true
//        }else{
//            return false
//        }
    }
    
    //getPost string
    func getPostString(params:[String:String]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}

