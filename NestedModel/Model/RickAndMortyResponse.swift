//
//  RickAndMortyResponse.swift
//  NestedModel
//
//  Created by made reihan on 14/12/23.
//

import Foundation

struct RickAndMortyResponse: Codable {
    public var results : [Character]
}

struct Character: Codable,Identifiable{
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var origin: Origin
    public var location: Location
}

struct Origin: Codable {
    public var name: String
}

struct Location: Codable {
    public var name: String
}
