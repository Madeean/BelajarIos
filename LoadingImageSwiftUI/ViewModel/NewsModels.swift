//
//  NewsModels.swift
//  LoadingImageSwiftUI
//
//  Created by made reihan on 16/12/23.
//

import Combine
import Foundation
import SwiftyJSON

class NewsModels: ObservableObject {
    @Published var data = [News]()

    init() {
        let url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=368a765097a349b89688113b3007e8fc"
        let session = URLSession(configuration: .default)

        session.dataTask(with: URL(string: url)!) { data, _, err in

            if err != nil {
                print((err?.localizedDescription)!)
                return
            }

            let json = try! JSON(data: data!)

            let items = json["articles"].array!

            for i in items {
                let title = i["title"].stringValue

                let description = i["description"].stringValue

                let imurl = i["urlToImage"].stringValue

                DispatchQueue.main.async {
                    self.data.append(News(title: title, image: imurl, description: description))
                }
            }

        }.resume()
    }
}
