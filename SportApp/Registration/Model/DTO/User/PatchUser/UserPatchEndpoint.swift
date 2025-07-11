//
//  UserEndpoint.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 10.07.2025.
//

import Foundation

struct UserPatchEndpoint: Endpoint {
    var baseURL = APIRoutes().userURL
    
    var userId: String

    var path: String

    var method = HTTPMethod.patch

    var headers: [String: String]?

    var loginString: String? // = "Admin:hashedpassword"
    
    var isTokenRequired: Bool = true
    
    init(userId: String) {
        self.userId = userId
        path = APIRoutes().getUserInfo.replacingOccurrences(of: "<id>", with: userId)
    }
}
