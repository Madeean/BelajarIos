//
//  ContentView.swift
//  FormSwiftUI
//
//  Created by made reihan on 09/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form{
                Section(){
                    NavigationLink(destination: About()){
                        HStack{
                            Image("MyPicture")
                                .resizable()
                                .frame(width: 50,height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment:.leading){
                                Text("Made Reihan Diva Suarna").font(.headline)
                                Text("Android & IOS Developer").font(.caption)
                            }
                        }.padding(.top,10).padding(.bottom,10)
                    }
                }
                
                Section(header:Text("Pengaturan Umum")){
                    NavigationLink(destination: About()){
                        HStack(spacing:20){
                            Image(systemName: "star.fill")
                                .frame(width: 35, height: 35)
                                .background(.orange)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Text("Pesanan Berbintang")
                        }
                    }
                    
                    
                    NavigationLink(destination: About()){
                        HStack(spacing:20){
                            Image(systemName: "tv")
                                .frame(width: 35, height: 35)
                                .background(.green)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Text("Whatsapp Web/Desktop")
                        }
                    }
                }
                
                Section(header:Text("Pengaturan Akun")){
                    NavigationLink(destination: About()){
                        HStack(spacing:20){
                            Image(systemName: "person")
                                .frame(width: 35, height: 35)
                                .background(.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Text("Akun")
                        }
                    }
                    
                    NavigationLink(destination: About()){
                        
                        HStack(spacing:20){
                            Image(systemName: "phone.circle")
                                .frame(width: 35, height: 35)
                                .background(.green)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Text("Chat")
                        }
                    }
                }
                
            }.navigationBarTitle("Setting")
        }
    }
}

#Preview {
    ContentView()
}

struct About:View{
    var body: some View{
        Text("Halaman About")
    }
}
