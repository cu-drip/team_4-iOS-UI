//
//  Participants.swift
//  SportApp
//
//  Created by user on 09.07.2025.
//

import Foundation

struct ParticipantDTO: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var surname: String
    var patronymic: String
    var phone_number: String?
    var email: String
    var date_of_birth: String?
    var sex: String?
    var weight: Double?
    var height: Double?
    var bio: String?
    var avatar_url: String?
    
}
