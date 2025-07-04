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
    case cyberSport
    
    static func toString(_ sport: Sport) -> String {
        switch sport {
        case .football:
            return "football"
        case .basketball:
            return "basketball"
        case .chess:
            return "chess"
        case .tennis:
            return "tennis"
        case .cyberSport:
            return "cyberSport"
        }
    }
    
    static func fromString(_ string: String) -> Sport {
        switch string {
        case "football":
            return .football
        case "basketball":
            return .basketball
        case "chess":
            return .chess
        case "tennis":
            return .tennis
        case "cyberSport":
            return .cyberSport
        default:
            return .football
        }
    }
    
    static let allCases: [Sport: [UserCodingKeys]] = [
        .football: [.age, .sexIsMan, .mmr],
        .basketball: [.age, .sexIsMan, .mmr, .height],
        .chess: [.mmr],
        .tennis: [.age, .sexIsMan, .mmr, .weight],
        .cyberSport: [.mmr, .sexIsMan]
    ]
}
