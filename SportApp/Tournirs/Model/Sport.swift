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
    case jiujitsu
    
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
        case .jiujitsu:
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
            return "boxing"
        case .jiujitsu:
            return "jiu-jitsu"
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
        case "boxing":
            return .boxing
        case "jiu-jitsu":
            return .jiujitsu
        default:
            return .football
        }
    }
    
    static let allCases: [Sport: [UserCodingKeys]] = [
        .football: [.age, .sexIsMan, .weight, .height],
        .basketball: [.age, .sexIsMan, .height, .weight],
        .chess: [.age, .mmr, .sexIsMan],
        .tennis: [.age, .sexIsMan, .height, .weight],
        .boxing: [.age, .sexIsMan, .height, .weight],
        .jiujitsu: [.age, .sexIsMan, .height, .weight]
    ]
    
    static let allSports: [Sport] = [.football, .basketball, .chess, .tennis, .boxing, .jiujitsu]
}
