//
//  ContentView.swift
//  ModelDataSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import SwiftUI

struct ProductModel: Identifiable {
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

struct ContentView: View {
    let data: [ProductModel] = [
        ProductModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto1", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        ProductModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto2", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        ProductModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto3", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        ProductModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto4", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        ProductModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto5", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        ProductModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto6", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        ProductModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto7", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        ProductModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto8", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        ProductModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto9", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        ProductModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto10", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
    ]

    var body: some View {
//        Product(data: data)
        NavigationView{
            ScrollView{
                ForEach(data){ row in
                    VStack(spacing:10){
                        Product(data: row)
                    }
                }
            }
            .navigationBarTitle("Sepeda MTB", displayMode: .automatic)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing: HStack{
                Button(action: {
                    print("helo")
                }, label: {
                    Image(systemName: "person.fill")
                })
                Button(action: {
                    print("helo")
                }, label: {
                    Image(systemName: "cart.fill")
                })
            }).accentColor(.secondary)
        }
        
    }
}

#Preview {
    ContentView()
}

struct Product: View {
    let data: ProductModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(data.fotoProduct).resizable().aspectRatio(contentMode: .fill).frame(height: 200).clipped()

                Button(action: {
                    print("hati")
                }, label: {
                    Image(systemName: "heart").padding().foregroundColor(.red)
                })
            }

            Text(data.namaProduct).font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/).bold().padding(.leading).padding(.trailing)

            Text("Rp. \(data.hargaProduct)").font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/).foregroundStyle(.red).bold().padding(.leading).padding(.trailing)

            HStack {
                Image(systemName: "mappin.circle")
                Text(data.lokasi)
            }.padding(.horizontal).padding(.top, 4)

            HStack {
                HStack {
                    ForEach(0 ..< data.jumlahRating, id: \.self) { items in
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                }
            }.padding(.horizontal).padding(.top, 4)

            Button(action: {
                print("keranjang")
            }, label: {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "cart")
                        Text("Tambah Ke Keranjang").font(.callout).padding()
                    }
                    Spacer()
                }
            }).background(.green).foregroundColor(.white).cornerRadius(10).padding()

        }.background(Color.warna).cornerRadius(15)
    }
}
