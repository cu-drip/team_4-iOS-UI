//
//  RegisterRequest.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 09.07.2025.
//

import Foundation

struct RegisterRequest: Codable {
    var email: String
    var password: String
    var name: String
    var surname: String
    var phoneNumber: String
    
    init(user: User) {
        email = user.email
        password = user.password
        let pop = user.phio.split(separator: " ")
        if pop.count >= 2 {
            name = String(pop[0])
            surname = String(pop[1])
        } else if pop.count == 1 {
            name = String(pop[0])
            surname = ""
        } else {
            name = ""
            surname = ""
        }
        phoneNumber = ""
    }
}

//{
//  "email": "string",
//  "password": "string",
//  "name": "string",
//  "surname": "string",
//  "phoneNumber": "string"
//}
