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
    var start_time: Date
    var created_at: Date
    var entry_cost: Double
    var is_team_based: Bool
    var max_participants: Int
    var organizer_id: UUID
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
}
