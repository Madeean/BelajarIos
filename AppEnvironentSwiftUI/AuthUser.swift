//
//  AuthUser.swift
//  AppEnvironentSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import Foundation
import Combine
class AuthUser:ObservableObject{
    var didChange = PassthroughSubject<AuthUser,Never>()

    @Published var isCorrect:Bool = true
    
    @Published var isLoggedIn:Bool = false{
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var userName:String = ""
    @Published var isApiReachable:Bool = true {
        didSet{
            didChange.send(self)
        }
    }
    
    
    func cekLogin(password:String, email:String){
        guard let url = URL(string: "http://localhost:3001/auth/api/v1/login") else{
            return
        }
        
        let body: [String : String] = ["password":password, "email":email]
        
        guard let finalBody = try? JSONEncoder().encode(body) else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            guard let data = data, error == nil else{
                print("no data response")
                DispatchQueue.main.async{
                    self.isApiReachable = false
                }
                return
            }
            
            let result = try? JSONDecoder().decode(UserLogin.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async{
                    if(result.success){
                        self.isLoggedIn = true
                        self.userName = result.user
                    }else{
                            self.isCorrect = false
                        
                    }
                }
            }else{
                DispatchQueue.main.async {
                    print("invalid response from web service")
                    self.isCorrect = false
                }
            }
            
        }.resume()
        
        
    }
    
}
