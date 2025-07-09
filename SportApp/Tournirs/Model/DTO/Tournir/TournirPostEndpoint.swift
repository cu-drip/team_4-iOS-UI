//
//  TournirPostEndpoint.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 07.07.2025.
//

import Foundation

struct TournirPostEndpoint: Endpoint {
    var baseURL = APIRoutes().baseURL

    var path = APIRoutes().getTournirs

    var method = HTTPMethod.post

    var headers: [String: String]?

    var loginString: String?// = "Admin:hashedpassword"
    
    var isTokenRequired: Bool = true
}
