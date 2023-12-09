//
//  ContentView.swift
//  DasarSwiftUi1
//
//  Created by made reihan on 09/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("uname").resizable().edgesIgnoringSafeArea(.all)
            VStack(spacing:20){
                handImageView()
                FormBox()
            }.padding(.all,20)
        }
        
        
    }
}

#Preview {
    ContentView()
}

struct handImageView:View{
    var body: some View{
        VStack{
            Image("LogoChallenge")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .foregroundColor(.white)
                .padding()
                .background(Color("warnaku"))
                .cornerRadius(20)
            
            Text("Hello Swift UI").foregroundColor(.white)
        }
    }
}

struct FormBox:View {
    
    @State var username:String = ""
    @State var password:String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Username").font(.callout).bold()
            TextField("Username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Password").font(.callout).bold()
            SecureField("Password...", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            Button(action: {
                print("hello")
            }, label: {
                HStack{
                    Spacer()
                    Text("Sign in")
                    Spacer()
                }
            }).padding().background(.black).cornerRadius(10).foregroundColor(.white)
        }.padding(.all,30).background(.orange).cornerRadius(10)
    }
}
