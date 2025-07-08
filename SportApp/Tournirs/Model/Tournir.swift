//
//  Tournir.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import Foundation

struct Tournir: Codable, Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var sport: String
    var type_group: TypeTournir
    var type_tournir: TypeIsTeam
    var start_time: Date
    var created_at: Date
    var entry_cost: Double
    var is_team_based: Bool
    var place: String
    var max_participants: Int
    var organizer_id: UUID
    var users: [User] = []
    var requirements: Requirements
}

struct Requirements: Codable, Hashable {
    var sexIsMan: Bool?
    var ageMin: Int
    var ageMax: Int
    var heightMin: Int
    var heightMax: Int
    var weightMin: Int
    var weightMax: Int
    var mmrMin: Int
    var mmrMax: Int
    
    init() {
        ageMin = 0
        ageMax = 100
        heightMin = 0
        heightMax = 200
        weightMin = 0
        weightMax = 100
        mmrMin = 0
        mmrMax = 10000
    }
}

enum TypeTournir: Codable, Identifiable, Hashable {
    case olympic
    case swiss
    case round_robin
    
    var id: Int {
        switch self {
        case .olympic:
            return 1
        case .swiss:
            return 2
        case .round_robin:
            return 3
        }
    }
    
    static func toString(_ type: TypeTournir) -> String {
        switch type {
        case .olympic:
            return "olympic"
        case .swiss:
            return "swiss"
        case .round_robin:
            return "round_robin"
        }
    }
    
    static func fromString(_ string: String) -> TypeTournir {
        switch string {
        case "olympic":
            return .olympic
        case "swiss":
            return .swiss
        case "round_robin":
            return .round_robin
        default:
            return .round_robin
        }
    }
}

enum TypeIsTeam: Codable, Identifiable, Hashable {
    case team
    case solo
    
    var id: Int {
        switch self {
        case .team:
            return 1
        case .solo:
            return 2
        }
    }
    
    static func toString(_ type: TypeIsTeam) -> String {
        switch type {
        case .team:
            return "team"
        case .solo:
            return "solo"
        }
    }
    
    static func fromString(_ string: String) -> TypeIsTeam {
        switch string {
        case "team":
            return .team
        case "solo":
            return .solo
        default:
            return .solo
        }
    }
}
