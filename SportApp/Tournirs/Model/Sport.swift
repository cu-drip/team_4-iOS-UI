//
//  Sport.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

enum Sport {
    case football
    case basketball
    case chess
    case tennis
    case cuberSpurt
    
    static func toString(_ sport: Sport) -> String {
        switch sport {
        case .football:
            return "Football"
        case .basketball:
            return "Basketball"
        case .chess:
            return "Chess"
        case .tennis:
            return "Tennis"
        case .cuberSpurt:
            return "CuberSpurt"
        }
    }
    
    static func fromString(_ string: String) -> Sport {
        switch string {
        case "Football":
            return .football
        case "Basketball":
            return .basketball
        case "Chess":
            return .chess
        case "Tennis":
            return .tennis
        case "CuberSpurt":
            return .cuberSpurt
        default:
            return .football
        }
    }
    
    static let allCases: [Sport: [UserCodingKeys]] = [
        .football: [.age, .sexIsMan, .mmr],
        .basketball: [.age, .sexIsMan, .mmr, .height],
        .chess: [.mmr],
        .tennis: [.age, .sexIsMan, .mmr, .weight],
        .cuberSpurt: [.mmr, .sexIsMan]
    ]
}
