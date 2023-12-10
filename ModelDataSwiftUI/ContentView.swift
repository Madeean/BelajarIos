//
//  ContentView.swift
//  ModelDataSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import SwiftUI



struct ContentView: View {
    let data: [DataModel] = [
        DataModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto1", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        DataModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto2", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        DataModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto3", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        DataModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto4", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        DataModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto5", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        DataModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto6", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        DataModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto7", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        DataModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto8", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
        DataModel(id: 1, namaProduct: "Sepeda Polygon", fotoProduct: "foto9", hargaProduct: 5000, lokasi: "tangerang", ratingCount: 5.0, jumlahRating: 5),
        DataModel(id: 2, namaProduct: "sepeda fixie", fotoProduct: "foto10", hargaProduct: 10000, lokasi: "bogor", ratingCount: 3.2, jumlahRating: 3),
    ]

//    @State var jumlahKeranjang: Int = 0
    @ObservedObject var globalData =  GlobalObject()


    var body: some View {
//        Product(data: data)
        NavigationView {
            ScrollView {
                ForEach(data) { row in
                    VStack(spacing: 10) {
                        Product(data: row, jumlahKeranjang: globalData)
                    }
                }
            }
            .navigationBarTitle("Sepeda MTB", displayMode: .automatic)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    print("helo")
                }, label: {
                    Image(systemName: "person.fill")
                })
                
                NavigationLink(destination: DetailView(globalData: globalData)){
                    keranjangView(jumlahKeranjang: globalData)
                }

            }).accentColor(.secondary)
        }
    }
}


struct DetailView: View {
    @ObservedObject var globalData: GlobalObject

    var body: some View {
            NavigationView{
            Text("Detail").navigationBarTitle("Detail").navigationBarItems(trailing: HStack {
                Button(action: {
                    print("helo")
                }, label: {
                    Image(systemName: "person.fill")
                })
                
                keranjangView(jumlahKeranjang: globalData)

            }).accentColor(.secondary)
        }
    }
}


struct keranjangView: View {
    
//    @Binding var jumlah:Int
    @ObservedObject var jumlahKeranjang: GlobalObject

    
    var body: some View {
        ZStack {

                Image(systemName: "cart.fill")
   

            Text("\(jumlahKeranjang.jumlah)").foregroundColor(.white).font(.body).padding(5).background(.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).offset(x: 10, y: -10)
        }
    }
}

#Preview {
    ContentView()
}

struct Product: View {
    let data: DataModel
    
//    @Binding var jumlahProduk:Int
    @ObservedObject var jumlahKeranjang: GlobalObject


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
                    ForEach(0 ..< data.jumlahRating, id: \.self) { _ in
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                }
            }.padding(.horizontal).padding(.top, 4)

            TambahkeranjangView(keranjang: jumlahKeranjang)

        }.background(Color.warna).cornerRadius(15)
    }
}

struct TambahkeranjangView:View {
    
//    @Binding var jumlah:Int
    
    @ObservedObject var keranjang: GlobalObject
    
    var body: some View {
        Button(action: {
            keranjang.jumlah += 1
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
    }
}
