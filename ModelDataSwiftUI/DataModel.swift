//
//  DataModel.swift
//  ModelDataSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import Foundation
struct DataModel: Identifiable {
    let id: Int
    let namaProduct: String
    let fotoProduct: String
    let hargaProduct: Int
    let lokasi: String
    let ratingCount: Double
    let jumlahRating: Int

    init(id: Int, namaProduct: String, fotoProduct: String, hargaProduct: Int, lokasi: String, ratingCount: Double, jumlahRating: Int) {
        self.id = id
        self.fotoProduct = fotoProduct
        self.namaProduct = namaProduct
        self.hargaProduct = hargaProduct
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}
