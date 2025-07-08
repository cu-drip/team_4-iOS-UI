//
//  TournirPostRequest.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 08.07.2025.
//

import Foundation

struct TournirPostRequest: Encodable {
    var title: String
    var description: String?
    var sport: String
    var typeTournament: String
    var typeGroup: String
    var matchesNumber: Int?
    var startTime: String?
    var createdAt: String?
    var entryCost: Double?
    var maxParticipants: Int?
    var registrationDeadline: String?
    var place: String?
    var organizedId: String
    
    init(tournir: Tournir) {
        title = tournir.title
        description = tournir.description
        sport = tournir.sport
        entryCost = tournir.entry_cost
        maxParticipants = tournir.max_participants
        registrationDeadline = nil
        place = tournir.place
        organizedId = tournir.organizer_id.uuidString
        typeTournament = TypeIsTeam.toString(tournir.type_tournir)
        typeGroup = TypeTournir.toString(tournir.type_group)
    }
}
