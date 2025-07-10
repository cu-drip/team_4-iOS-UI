//
//  ParticipantsEndpoint.swift
//  SportApp
//
//  Created by user on 09.07.2025.
//

import Foundation

struct ParticipantEndpoint: Endpoint {
    var baseURL = APIRoutes().baseURL
    var tournamentID: String

    var path: String {
        return APIRoutes().getParticipants.replacingOccurrences(of: "{id}", with: "\(tournamentID)")
    }

    var method = HTTPMethod.get
    var headers: [String: String]? = ["Content-Type": "application/json"]
    var loginString: String? = "Admin:hashedpassword"
    var isTokenRequired: Bool = true
    
    init(tournamentID: String) {
        self.tournamentID = tournamentID
    }
}

