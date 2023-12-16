//
//  Model.swift
//  AppEnvironentSwiftUI
//
//  Created by made reihan on 16/12/23.
//

import Foundation

struct UserLogin: Codable, Identifiable {
    let id = UUID()
    let success: Bool
    let token: String
    let expires: Int
    let currUser: Int
    let user: String
    let role: Int
    let isVerified: Int
}
