//
//  ContentView.swift
//  GeomatryR
//
//  Created by made reihan on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geo in
            HStack{
                Text("hello").frame(width: geo.size.width/2, height: geo.size.height/2).background(.orange)
                Text("hello").frame(width: geo.size.width/2, height: geo.size.height/2).background(.orange)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
