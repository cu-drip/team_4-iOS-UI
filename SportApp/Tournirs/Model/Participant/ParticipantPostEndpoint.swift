//
//  ParticipantsPostEndpoint.swift
//  SportApp
//
//  Created by user on 09.07.2025.
//

import Foundation

struct ParticipantPostEndpoint: Endpoint {
    var baseURL = APIRoutes().baseURL

    var path = APIRoutes().getParticipants

    var method = HTTPMethod.post

    var headers: [String: String]?

    var loginString: String?
    
    var isTokenRequired: Bool = true
}
