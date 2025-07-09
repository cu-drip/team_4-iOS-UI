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
    var phone_number: String?
    var email: String
    var hashedPassword: String
    var dateOfBirth: Date?
    var age: Int?
    var sex: String?
    var weight: Double?
    var height: Double?
    var createdAt: String
    var bio: String?
    var avatarUrl: String?
    var admin: Bool
    
    // всё переписать на такое
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.surname = try container.decode(String.self, forKey: .surname)
        self.patronymic = try container.decodeIfPresent(String.self, forKey: .patronymic)
        self.phone_number = try container.decodeIfPresent(String.self, forKey: .phone_number)
        self.email = try container.decode(String.self, forKey: .email)
        self.hashedPassword = try container.decode(String.self, forKey: .hashedPassword)
        self.dateOfBirth = try container.decodeIfPresent(Date.self, forKey: .dateOfBirth)
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
        self.sex = try container.decodeIfPresent(String.self, forKey: .sex)
        self.weight = try container.decodeIfPresent(Double.self, forKey: .weight)
        self.height = try container.decodeIfPresent(Double.self, forKey: .height)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
        self.avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        self.admin = try container.decode(Bool.self, forKey: .admin)
    }
    
    init (user: User) {
        id = user.id.uuidString
        let pop = user.phio.split(separator: " ")
        if pop.count >= 3 {
            name = String(pop[0])
            surname = String(pop[1])
            patronymic = String(pop[2])
        } else if pop.count == 2 {
            name = String(pop[0])
            surname = String(pop[1])
        } else if pop.count == 1 {
            name = String(pop[0])
            surname = ""
        } else {
            name = ""
            surname = ""
        }
        email = user.email
        hashedPassword = user.password
        createdAt = Date().description
        admin = user.isAdmin
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
