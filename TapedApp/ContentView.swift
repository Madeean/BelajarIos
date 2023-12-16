//
//  ContentView.swift
//  TapedApp
//
//  Created by made reihan on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Feed().padding()
                Spacer()
            }
            .navigationBarTitle("instagream")
        }
    }
}

#Preview {
    ContentView()
}

struct Feed: View {
    @State var isLove: Bool = false
    var body: some View {
        VStack {
            HStack {
                Circle().frame(width: 25, height: 25)
                Text("made reihan")
                Spacer()
                Image(systemName: "circle.grid.2x2")
            }.padding()
            Image("MyPicture").resizable().aspectRatio(contentMode: .fill).frame(height: 400).clipped()

            HStack {
                Image(systemName: isLove ? "heart.fill" : "heart").resizable().frame(width: 25, height: 25).foregroundColor(.red).onTapGesture {
                    self.isLove = !self.isLove
                    print(self.isLove)
                }

                Image(systemName: "message").resizable().frame(width: 25, height: 25)
                Image(systemName: "paperplane").resizable().frame(width: 25, height: 25)
                Spacer()
                Image(systemName: "bookmark").resizable().frame(width: 25, height: 25)
            }.padding()
        }
        .border(.gray)
    }
}
