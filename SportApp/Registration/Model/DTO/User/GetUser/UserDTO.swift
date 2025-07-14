//
//  UserDTO.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 09.07.2025.
//

import Foundation

struct UserDTO: Codable {
    var id: String
    var name: String
    var surname: String
    var patronymic: String?
    var phoneNumber: String?
    var email: String
    var hashedPassword: String?
    var dateOfBirth: String?
    var age: Int?
    var sex: String?
    var weight: Double?
    var height: Double?
    var createdAt: String
    var bio: String?
    var avatarUrl: String?
    var admin: Bool
    
    init(user: User) {
        self.id = user.id.uuidString
        self.email = user.email
        //self.hashedPassword = user.password
        self.admin = user.isAdmin

        let components = user.phio.split(separator: " ", omittingEmptySubsequences: false)
        switch components.count {
        case 0:
            self.name = ""
            self.surname = ""
            self.patronymic = nil
        case 1:
            self.name = String(components[0])
            self.surname = ""
            self.patronymic = nil
        case 2:
            self.name = String(components[0])
            self.surname = String(components[1])
            self.patronymic = nil
        default:
            self.name = String(components[0])
            self.surname = String(components[1])
            self.patronymic = String(components[2])
        }

        self.phoneNumber = user.phone
        self.dateOfBirth = nil
        self.age = user.age
        self.sex = user.sexIsMan.map { $0 ? "male" : "female" }
        self.weight = user.weight
        self.height = user.height
        self.bio = user.bio
        self.avatarUrl = nil
        self.createdAt = ISO8601DateFormatter().string(from: Date())
    }
}

//{
//  "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//  "name": "string",
//  "surname": "string",
//  "patronymic": "string",
//  "phone_number": "string",
//  "email": "user@example.com",
//  "hashed_password": "string",
//  "is_admin": true,
//  "date_of_birth": "2025-07-08",
//  "age": 0,
//  "sex": "male",
//  "weight": 0,
//  "height": 0,
//  "created_at": "2025-07-08T15:37:15.546Z",
//  "bio": "string",
//  "avatar_url": "string"
//}
