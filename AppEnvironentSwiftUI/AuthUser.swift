//
//  AuthUser.swift
//  AppEnvironentSwiftUI
//
//  Created by made reihan on 10/12/23.
//

import Foundation

class AuthUser:ObservableObject{
    @Published var isLoggedIn:Bool = false
    @Published var isCorrect:Bool = true
}
