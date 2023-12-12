//
//  AppEnvironentSwiftUIApp.swift
//  AppEnvironentSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import SwiftUI

@main
struct AppEnvironentSwiftUIApp: App {
    @StateObject var authUser = AuthUser()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authUser)
        }
    }
}
