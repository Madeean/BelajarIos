//
//  ContentView.swift
//  FetchApiJsonOke
//
//  Created by made reihan on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var listData = ApiService()
    
    
    var body: some View {
        List(listData.post) { post in
            VStack(alignment:.leading) {
                Text(post.title).font(.system(size: 24,weight: .bold, design: .rounded))
                Text(post.body).font(.system(size: 16,weight: .light, design: .rounded))
            }
        }
    }
}

#Preview {
    ContentView()
}
