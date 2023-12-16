//
//  ApiService.swift
//  FetchApiJsonOke
//
//  Created by made reihan on 14/12/23.
//

import Foundation

class ApiService: ObservableObject{
    @Published var post = [Post]()
    
    init(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            do{
                if let postData=data{
                    let decodedData = try JSONDecoder().decode([Post].self, from: postData)
                    
                    DispatchQueue.main.async{
                        self.post = decodedData
                    }
                }else{
                    print("no data")
                }
            }catch{
                print("error")
            }
        }.resume()
    }
}
