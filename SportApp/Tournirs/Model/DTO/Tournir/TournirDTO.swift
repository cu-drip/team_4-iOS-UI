//
//  TournirDTO.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import Foundation

struct TournirDTO: Codable {
    var id: String
    var title: String
    var description: String
    var sport: String
    var typeTournament: String
    var typeGroup: String
    var matchesNumber: String
    var startTime: String
    var createdAt: String
    var entryCost: String
    var maxParticipants: String
    var registrationDeadline: String
    var place: String
    var organizerId: String
}


/*
 
 Table tournaments {
   id                    uuid   [pk]
   title                 varchar
   description           text
   sport                 sport
   type_tournament       type_tournament
   type_group            type_group
   matches_number        int
   start_time            timestamp
   created_at            timestamp
   entry_cost            decimal
   max_participants      int
   registration_deadline timestamp
   place                 varchar
   organizer_id          uuid
 }
 
 */
