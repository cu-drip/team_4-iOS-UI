//
//  APIRoutes.swift
//  Founders
//
//  Created by Владимир Мацнев on 18.03.2025.
//

import Foundation

struct APIRoutes {
    let baseURL = URL(string: "http://51.250.38.151:8082")
    let userURL = URL(string: "http://51.250.38.151:8081")
    let bffURL = URL(string: "http://51.250.38.151:8080")
    let getTournirs: String = "/api/v1/tournaments"
    let login: String = "/api/v1/auth/login"
    let register: String = "/api/v1/auth/register"
    let getUserInfo: String = "/api/v1/users/<id>"
    let getParticipants: String = "/api/v1/tournaments/{id}/participants"
    let postPartisipant: String = "/api/v1/tournaments/{tournamentId}/participants/{participantId}"
}
