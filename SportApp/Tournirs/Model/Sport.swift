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
    case boxing
    case jiu_jitsu
    
    static func toString(_ sport: Sport) -> String {
        switch sport {
        case .football:
            return "Футбол"
        case .basketball:
            return "Баскетбол"
        case .chess:
            return "Шахматы"
        case .tennis:
            return "Теннис"
        case .boxing:
            return "Бокс"
        case .jiu_jitsu:
            return "Джиу-джитсу"
        }
    }
    
    static func toStringEng(_ sport: Sport) -> String {
        switch sport {
        case .football:
            return "football"
        case .basketball:
            return "basketball"
        case .chess:
            return "chess"
        case .tennis:
            return "tennis"
        case .boxing:
            return "Бокс"
        case .jiu_jitsu:
            return "Джиу-джитсу"
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
        case "Бокс":
            return .boxing
        case "Джиу-джитсу":
            return .jiu_jitsu
        default:
            return .football
        }
    }
    
    static let allCases: [Sport: [UserCodingKeys]] = [
        .football: [.age, .sexIsMan, .mmr],
        .basketball: [.age, .sexIsMan, .mmr, .height],
        .chess: [.mmr],
        .tennis: [.age, .sexIsMan, .mmr, .weight],
        .boxing: [.height, .age, .sexIsMan],
        .jiu_jitsu: [.height, .age, .sexIsMan]
    ]
    
    static let allSports: [Sport] = [.football, .basketball, .chess, .tennis, .boxing, .jiu_jitsu]
}
