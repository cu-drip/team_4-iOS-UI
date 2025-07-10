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
    var date_of_birth: String?
    var sex: String?
    var weight: Double?
    var height: Double?
    var bio: String?
    var avatar_url: String?
    
}
