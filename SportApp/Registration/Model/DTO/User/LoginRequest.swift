//
//  LoginRequest.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 09.07.2025.
//

import Foundation

struct LoginRequest: Codable {
    public var email: String
    public var password: String
    
    init(user: User) {
        email = user.email
        password = user.password
    }
}
