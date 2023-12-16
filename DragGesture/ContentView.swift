//
//  ContentView.swift
//  DragGesture
//
//  Created by made reihan on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu: Bool = false
    @State var offset = CGSize.zero
    var body: some View {
        
        let drag = DragGesture()
            .onChanged{ gesture in
                self.offset = gesture.translation
                
            }.onEnded{value in
                self.offset = CGSize.zero
                self.showMenu = false
            }
        
        return ZStack{
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack{
                Image("LogoChallenge").resizable().frame(width: 300, height: 300)
                
                Button(action: {
                    withAnimation{
                        self.showMenu.toggle()
                    }
                }, label: {
                    Text("Promo Merdeka").padding().background(.green).foregroundColor(.white).cornerRadius(20)
                })
            }
            
            
            if showMenu{
                Kupon().transition(.move(edge: .bottom).animation(.default)).offset(y:self.offset.height).gesture(drag)
            }
        }
        
    }
}

struct Kupon:View {
    var body: some View {
        VStack{
            Text("anda dapet kupon merdeka").font(.largeTitle).bold().foregroundColor(.white)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(.red).cornerRadius(20).edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
