//
//  ApiService.swift
//  NestedModel
//
//  Created by made reihan on 14/12/23.
//

import Foundation
import SwiftUI
import Combine

class ApiService: ObservableObject{
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var dataTotal = [Character]() {
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var isLoading = true
    
    init(){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
        fatalError("INVALID URL")}
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            let result = try? JSONDecoder().decode(RickAndMortyResponse.self, from: data)
            
            if let result = result{
                DispatchQueue.main.async{
                    sleep(1)
                    self.dataTotal = result.results
                    self.isLoading = false
                    print(self.dataTotal)
                }
            }
        }.resume()
    }
}
