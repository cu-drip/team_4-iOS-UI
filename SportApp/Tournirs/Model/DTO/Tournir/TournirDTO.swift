//
//  TournirDTO.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import Foundation

struct TournirDTO: Codable {
    var id: String
    var title: String?
    var description: String?
    var sport: String?
    var matchesNumber: Int?
    var startTime: String?
    var createdAt: String?
    var entryCost: Double?
    var maxParticipants: Int?
    var registrationDeadline: String?
    var place: String?
    var organizedId: String?
}

//"id":"2adad6cb-1ae9-4948-a4d9-59bd847b8753",
//"title":"Summer Championship",
//"description":"A thrilling summer tournament for football enthusiasts.",
//"sport":"football",
//"matchesNumber":15,
//"startTime":"2025-07-20T15:00:00",
//"createdAt":"2025-07-03T13:57:30",
//"entryCost":50.0,
//"maxParticipants":16,
//"registrationDeadline":"2025-07-15T23:59:59",
//"place":"Central Stadium",
//"organizedId":"b1f0ae09-ba2f-4da5-be42-52e71c6cccbc"
//

//var typeTournament: String
//var typeGroup: String


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
