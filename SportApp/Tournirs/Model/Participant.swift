//
//  Participant.swift
//  SportApp
//
//  Created by user on 10.07.2025.
//

import Foundation

struct Participant: Identifiable, Hashable, Codable {
    var id: UUID
    var phio: String
    var phone_number: String?
    var email: String
    var age: Int?
    var sex: Bool?
    var weight: Double?
    var height: Double?
}
