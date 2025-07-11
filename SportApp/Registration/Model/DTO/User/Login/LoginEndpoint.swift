//
//  LoginEndpoint.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 09.07.2025.
//

import Foundation

struct LoginEndpoint: Endpoint {
    var baseURL = APIRoutes().userURL

    var path = APIRoutes().login

    var method = HTTPMethod.post

    var headers: [String: String]?

    var loginString: String? // = "Admin:hashedpassword"
    
    var isTokenRequired: Bool = false
}
