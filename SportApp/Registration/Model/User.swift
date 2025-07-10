//
//  User.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id: UUID
    var phio: String
    var phone: String?
    var password: String
    var email: String
    var dateOfBirth: Date?
    var age: Int?
    var sexIsMan: Bool?
    var weight: Double?
    var height: Double?
    var mmr: Double?
    var bio: String?
    var isAdmin: Bool
    
    init(dto: UserDTO) {
        if let uuid = UUID(uuidString: dto.id) {
            self.id = uuid
        } else {
            self.id = UUID()
        }

        var fullName = dto.name + (dto.surname == "" ? "" : " " + dto.surname)
        if let patronymic = dto.patronymic, !patronymic.isEmpty {
            fullName += " \(patronymic)"
        }
        self.phio = fullName

        self.phone = dto.phone_number
        self.password = dto.hashedPassword
        self.email = dto.email
        self.dateOfBirth = Self.dateFormatter.date(from: dto.dateOfBirth ?? "")
        self.age = dto.age
        self.sexIsMan = dto.sex.map { $0.lowercased() == "male" || $0.lowercased() == "мужской" || $0.lowercased() == "man" }
        self.weight = dto.weight
        self.height = dto.height
        self.bio = dto.bio
        self.isAdmin = dto.admin
        self.mmr = nil
    }
    
    init(
        id: UUID,
        phio: String,
        phone: String? = nil,
        password: String,
        email: String,
        dateOfBirth: Date? = nil,
        age: Int? = nil,
        sexIsMan: Bool? = nil,
        weight: Double? = nil,
        height: Double? = nil,
        mmr: Double? = nil,
        bio: String? = nil,
        isAdmin: Bool = false
    ) {
        self.id = id
        self.phio = phio
        self.phone = phone
        self.password = password
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.sexIsMan = sexIsMan
        self.weight = weight
        self.height = height
        self.mmr = mmr
        self.bio = bio
        self.isAdmin = isAdmin
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Пример ISO 8601
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

enum UserCodingKeys: String {
    case email
    case dateOfBirth
    case age
    case sexIsMan
    case weight
    case height
    case mmr
    case bio
}
