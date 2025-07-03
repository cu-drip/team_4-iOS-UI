//
//  EventEndpoint.swift
//  SiriusYoungCon
//
//  Created by Владимир Мацнев on 27.03.2025.
//

import Foundation

struct TournirEndpoint: Endpoint {
    var baseURL = APIRoutes().baseURL

    var path = APIRoutes().getTournirs

    var method = HTTPMethod.get

    var headers: [String: String]?

}
