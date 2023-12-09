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

struct Home: View {
    var body: some View {
        NavigationView {
            Konten()

            .navigationBarItems(leading: HStack {
                Button(action: {
                    print(
                        "hello"
                    )
                }) {
                    Image(
                        "LogoDicoding"
                    ).renderingMode(
                        .original
                    ).resizable().frame(
                        width: 90,
                        height: 20
                    )
                }

            },
            trailing: HStack(
                spacing: 10
            ) {
                Button(action: {
                    print(
                        "hello print"
                    )
                }) {
                    Image(
                        systemName: "tray.full"
                    ).foregroundColor(
                        .secondary
                    )
                }
                Button(action: {
                    print(
                        "hello print"
                    )
                }) {
                    Image(
                        systemName: "video.fill"
                    ).foregroundColor(
                        .secondary
                    )
                }
                Button(action: {
                    print(
                        "hello print"
                    )
                }) {
                    Image(
                        systemName: "magnifyingglass"
                    ).foregroundColor(
                        .secondary
                    )
                }

                Button(action: {
                    print(
                        "hello print"
                    )
                }) {
                    Image(
                        "MyPicture"
                    ).renderingMode(
                        .original
                    ).resizable().frame(
                        width: 20,
                        height: 20
                    ).clipShape(
                        Circle()
                    )
                }
            }
            )
        }
    }
}


struct Konten:View {
    let listModel:[Model] = Model.getModel()
    var body: some View {
        List(listModel){ item in
            KontenItem(model: item).background(.green)
        }
    }
}

struct KontenItem:View {
    let model:Model
    var body: some View {
        VStack{
            ZStack(alignment:.bottomTrailing){
                Image("uname").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).cornerRadius(8)
                
                Text("10:00")
                    .padding(.all,5)
                    .foregroundColor(.white)
                    .font(.caption)
                    .background(.black)
                    .cornerRadius(5)
                    .padding(.trailing,5)
                    .padding(.bottom,5)
            }
            Spacer(minLength: 10)
            
            HStack{
                Image("MyPicture").resizable().frame(width: 30, height: 30).clipShape(Circle()).padding(.trailing,10)
                
                VStack(alignment: .leading){
                    Text(model.judul).font(.headline)
                    Text(model.description).lineLimit(2)
                }
                
                Spacer()
                Image(systemName: "list.bullet").padding(.leading,10)
            }
        }.padding(.all,8).cornerRadius(16)
        
        Spacer()
    }
}
