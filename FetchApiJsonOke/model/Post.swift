//
//  Post.swift
//  FetchApiJsonOke
//
//  Created by made reihan on 14/12/23.
//

import Foundation

struct Post: Codable, Identifiable{
    public var id: Int
    public var title: String
    public var body: String
}
