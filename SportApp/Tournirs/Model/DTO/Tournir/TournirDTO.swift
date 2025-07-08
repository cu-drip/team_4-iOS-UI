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
    var typeTournament: String?
    var typeGroup: String?
    var matchesNumber: Int?
    var startTime: String?
    var createdAt: String?
    var entryCost: Double?
    var maxParticipants: Int?
    var registrationDeadline: String?
    var place: String?
    var organizedId: String?
    
    init(tournir: Tournir) {
        id = tournir.id.uuidString
        title = tournir.title
        description = tournir.description
        sport = tournir.sport
        entryCost = tournir.entry_cost
        maxParticipants = tournir.max_participants
        registrationDeadline = nil
        place = tournir.place
        organizedId = tournir.organizer_id.uuidString
    }
}

//"id": "13e5ab2c-8c51-475f-8820-5c03efb11332",
//"title": "Quick Shot Tourney",
//"description": "Мега гига турнир по теннису",
//"sport": "tennis",
//"typeTournament": "solo",
//"typeGroup": "olympic",
//"matchesNumber": 4,
//"startTime": null,
//"createdAt": "2025-07-07T15:56:09.884662",
//"entryCost": 1000.0,
//"maxParticipants": 32,
//"registrationDeadline": null,
//"place": "Анапа",
//"organizedId": "82a0a76b-a3f5-4d7c-a6e4-c65b9e342bd7"



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
