//
//  ContentView.swift
//  CheckingNetwork
//
//  Created by made reihan on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var util:UtilitySwift
    @State var isShowMenu: Bool = false
    
    var body: some View {
        VStack{
            Text("hii madee")
            Button(action: {
                self.util.monitorNetwork()
                self.isShowMenu.toggle()
            }, label: {
                Text("check network").padding().background(.orange).foregroundColor(.white).cornerRadius(20)
            }).padding().sheet(isPresented: $isShowMenu){
                ModalView(showModal: self.$isShowMenu, isConn: self.$util.isConn)
            }
            
        }
    }
}

struct ModalView:View {
    @Binding var showModal:Bool
    @Binding var isConn: Bool
    var body: some View {
        if isConn {
            return ZStack{
                Color.green.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image(systemName: "wifi").resizable().frame(width: 100,height: 80)
                    
                    Text("Yea im online").font(.title).padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundColor(.white)
                }
            }
        }else{
            return ZStack{
                Color.red.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image(systemName: "wifi").resizable().frame(width: 100,height: 80)
                    
                    Text("Yea im offline").font(.title).padding()
                    
                    Button(action: {
                        self.showModal.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
