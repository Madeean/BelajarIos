//
//  ContentView.swift
//  AppEnvironentSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userAuth: AuthUser

    
    var body: some View {
        if !userAuth.isLoggedIn{
            return AnyView( LoginView())
        }else{
            return AnyView( HomeView().animation(.easeIn))
        }
    }
}

struct HomeView:View {
    @EnvironmentObject var userAuth: AuthUser

    var body: some View {
        NavigationView{
            ZStack{
                Color.purple
                Text("Selaamt datang \(userAuth.userName)").foregroundColor(.white)
                    .navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        userAuth.isLoggedIn = false
                        userAuth.isApiReachable = true
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right.circle")
                    }))
            }
        }
    }
}

struct LoginView: View {
    
    @EnvironmentObject var userAuth: AuthUser
    
    @State var username: String = ""
    @State var password: String = ""

    let lightGreyColor = Color(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0, opacity: 1.0)
    
//    func cekLogin(){
//        if(username == "Admin" && password == "123"){
//            userAuth.isLoggedIn = true
//            userAuth.isCorrect = true
//            print("masuk")
//        }else{
//            userAuth.isLoggedIn = false
//            userAuth.isCorrect = false
//        }
//    }
    
    @State var isEmptyField = false

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hi!").bold().font(.largeTitle).foregroundStyle(.white)
                            Text("Welcome Back").bold().font(.title).foregroundStyle(.white)
                        }

                        Spacer()

                        Image("bitmap").resizable().frame(width: 120, height: 80).padding()
                    }

                    Spacer()

                }.frame(height: 180).padding(30).background(.purple).clipShape(CustomShape(corner: .bottomRight, radii: 100)).edgesIgnoringSafeArea(.top)
                
                
                if !self.userAuth.isApiReachable{
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "exclamationmark.cloud").foregroundColor(.white)
                            Text("Situs tidak dapat dijangkau").font(.body).foregroundStyle(.white)
                            Spacer()
                        }.padding().background(.red).cornerRadius(20)
                    }.padding()
                }
                

                VStack(alignment: .leading) {
                    Text("username")
                    TextField("username...", text: $username).padding().background(lightGreyColor).cornerRadius(5).autocapitalization(.none).keyboardType(.emailAddress)

                    Text("password")
                    SecureField("password...", text: $password).padding().background(lightGreyColor).cornerRadius(5).autocapitalization(.none)
                    
                    
//                    error view
                    if !userAuth.isCorrect {
                        Text("username and passowrd salah").foregroundColor(.red)
                    }
                    
                    if isEmptyField {
                        Text("username and passowrd tidak boleh kosong").foregroundColor(.red)
                    }

                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                            Text("forgot password?")
                        })
                        Spacer()
                    }.padding(.vertical, 10)

                    HStack {
                        Spacer()
                            Text("sign in").bold().font(.callout).foregroundStyle(.white)
                        Spacer()
                    }.padding().background(.purple).cornerRadius(15).onTapGesture {
                        if username.isEmpty || password.isEmpty{
                            self.isEmptyField = true
                        }else{
                            self.isEmptyField = false
                            self.userAuth.cekLogin(password: password, email: username)
                        }
                    }

                    HStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                            Text("our privacy police").bold().font(.callout).foregroundStyle(.purple)
                        })
                        Spacer()
                    }.padding()

                    HStack {
                        Text("dont have an account?")
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                            Text("sign up").bold().font(.callout).foregroundStyle(.purple)
                        })
                    }.padding()

                }.padding(30)

                Spacer()
            }
        }
    }
}

struct CustomShape: Shape {
    var corner: UIRectCorner
    var radii: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))

        return Path(path.cgPath)
    }
}

#Preview {
    LoginView()
}
