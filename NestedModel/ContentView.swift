//
//  ContentView.swift
//  NestedModel
//
//  Created by made reihan on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetch = ApiService()
    
    
    var body: some View {
        
        ZStack{
            VStack{
                ForEach(fetch.dataTotal) {
                    data in
                    
                    Text(data.name + " - " + data.species)
                }                
            }
            
            if fetch.isLoading {
                VStack{
                    indicatorView()
                    Text("please wait")
                }.padding().background(.white).cornerRadius(20).shadow(color: .secondary, radius: 20)
            }
        }

//        Text("home").onAppear{
//            print(fetch.dataTotal)
//        }
    }
}

struct indicatorView: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.red
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

#Preview {
    ContentView()
}
