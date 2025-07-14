//
//  Tournir.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import Foundation

struct Tournir: Codable, Identifiable, Hashable {
    var id: UUID
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
    var tournirInstanteState: TournirInstantState
    var currentMatch: Int = 0
    var matchs: Int
    var winner: User?
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        sport: String,
        type_group: TypeTournir,
        type_tournir: TypeIsTeam,
        start_time: Date,
        created_at: Date,
        entry_cost: Double,
        is_team_based: Bool,
        place: String,
        max_participants: Int,
        organizer_id: UUID,
        users: [User] = [],
        requirements: Requirements,
        tournirInstaseState: TournirInstantState = .openedRegistrationTournaments,
        winner: User? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.sport = sport
        self.type_group = type_group
        self.type_tournir = type_tournir
        self.start_time = start_time
        self.created_at = created_at
        self.entry_cost = entry_cost
        self.is_team_based = is_team_based
        self.place = place
        self.max_participants = max_participants
        self.organizer_id = organizer_id
        self.users = users
        self.requirements = requirements
        self.matchs = 0
        if max_participants > 0 {
            let logValue = log2(Double(max_participants))
            if logValue.isFinite {
                matchs = Int(ceil(logValue))
            }
        }
        self.tournirInstanteState = tournirInstaseState
        
        self.max_participants = nextPowerOfTwo(max_participants)
        self.winner = winner
    }
    
    func nextPowerOfTwo(_ number: Int) -> Int {
        guard number > 0 else { return 1 }
        let exponent = log2(Double(number - 1)).rounded(.up)
        return Int(pow(2.0, exponent))
    }
}

enum TournirInstantState: String, Codable, Identifiable, Hashable {
    case endedTournaments
    case ongoingTournaments
    case closedRegistrationTournaments
    case openedRegistrationTournaments
    
    var id: Int {
        switch self {
        case .endedTournaments:
            return 1
        case .ongoingTournaments:
            return 2
        case .closedRegistrationTournaments:
            return 3
        case .openedRegistrationTournaments:
            return 4
        }
    }
    static func toString(_ state: TournirInstantState) -> String {
        switch state {
        case .endedTournaments:
            return "Завершенные соревнования"
        case .ongoingTournaments:
            return "Проходит сейчас"
        case .closedRegistrationTournaments:
            return "Закончилась регистация"
        case .openedRegistrationTournaments:
            return "Идёт регистрация"
        }
    }
    static func fromString(_ string: String) -> TournirInstantState {
        switch string {
        case "Завершенные соревнования":
            return .endedTournaments
        case "Проходит сейчас":
            return .ongoingTournaments
        case "Закончилась регистация":
            return .closedRegistrationTournaments
        case "Идёт регистрация":
            return .openedRegistrationTournaments
        default:
            return .openedRegistrationTournaments
        }
    }
    static func nextState(_ state: TournirInstantState) -> TournirInstantState {
        switch state {
        case .openedRegistrationTournaments:
            return .closedRegistrationTournaments
        case .closedRegistrationTournaments:
            return .ongoingTournaments
        case .ongoingTournaments:
            return .endedTournaments
        case .endedTournaments:
            return .endedTournaments
        }
    }
    
    static let list: [TournirInstantState] = [.openedRegistrationTournaments, .closedRegistrationTournaments, .ongoingTournaments, .endedTournaments]
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
        mmrMin = 500
        mmrMax = 3000
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
