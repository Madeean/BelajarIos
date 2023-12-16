//
//  ContentView.swift
//  LoadingImageSwiftUI
//
//  Created by made reihan on 16/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView:View {
    
    @ObservedObject var news = NewsModels()
    
    var body: some View {
        
        List(news.data){ item in
            HStack{
                if item.image != ""{
                    WebImage(url: URL(string: item.image)).resizable().scaledToFit().frame(width: 120, height: 170).background(.secondary).cornerRadius(10)
                }else{
                    Image("LogoEvent").resizable().frame(width: 120, height: 170).cornerRadius(10)
                }
                
                VStack(alignment:.leading){
                    Text(item.title).fontWeight(.bold)
                    Text(item.description).font(.caption).lineLimit(4).multilineTextAlignment(.leading)
                }
                
            }
        }

    }
}

#Preview {
    ContentView()
}
