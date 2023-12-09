//
//  Model.swift
//  CustomeNavigationView
//
//  Created by made reihan on 09/12/23.
//

import Foundation

struct Model: Identifiable {
    var id = UUID()
    let judul: String
    let description: String
}

extension Model{
    static func getModel()->[Model]{
        return [
            Model(judul: "made1", description: "made1"),
            Model(judul: "made1", description: "made1"),
            Model(judul: "made1", description: "made1"),
            Model(judul: "made1", description: "made1"),
            Model(judul: "made1", description: "made1")
        ]
    }
}
