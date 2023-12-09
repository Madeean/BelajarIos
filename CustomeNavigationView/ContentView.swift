//
//  ContentView.swift
//  CustomeNavigationView
//
//  Created by made reihan on 09/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#Preview {
    ContentView()
}


struct Home:View {
    var body: some View {
        NavigationView(){
            Text("Hello World")
            
                .navigationBarItems(leading: HStack{
                    
                    
                    Button(action:{
                        print("hello")
                    }){
                        Image("LogoDicoding").renderingMode(.original).resizable().frame(width: 90, height: 20)
                    }
                    
                    
                    
                }, trailing: HStack(spacing:10){
                    Button(action:{
                        print("hello print")
                    }){
                        Image(systemName: "tray.full").foregroundColor(.secondary)
                    }
                    Button(action:{
                        print("hello print")
                    }){
                        Image(systemName: "video.fill").foregroundColor(.secondary)
                    }
                    Button(action:{
                        print("hello print")
                    }){
                        Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                    }

                    Button(action:{
                        print("hello print")
                    }){
                        Image("MyPicture").renderingMode(.original).resizable().frame(width: 20, height: 20).clipShape(Circle())
                    }
                }
                                    
                )
        }
    }
}
