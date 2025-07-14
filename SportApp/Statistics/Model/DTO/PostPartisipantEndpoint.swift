//
//  PostPartisipantEndpoint.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 13.07.2025.
//

import Foundation

struct PostPartisipantEndpoint: Endpoint {
    var baseURL = APIRoutes().baseURL
    
    var userId: String
    var tournirId: String

    var path: String

    var method = HTTPMethod.post

    var headers: [String: String]?

    var loginString: String? // = "Admin:hashedpassword"
    
    var isTokenRequired: Bool = true
    
    init(userId: String, tournirId: String) {
        self.userId = userId
        self.tournirId = tournirId
        path = APIRoutes().postPartisipant.replacingOccurrences(of: "{participantId}", with: userId).replacingOccurrences(of: "{tournamentId}", with: tournirId)
    }
}

