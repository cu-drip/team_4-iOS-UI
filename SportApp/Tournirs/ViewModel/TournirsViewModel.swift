//
//  TournirsViewModel.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import Combine
import Foundation

@MainActor
class TournirsViewModel: ObservableObject {
    @Published var tournirs: [Tournir] = []
    
    init() {
        tournirs = loadMockTournirs()
        //loadTournirs()
    }
    
    func loadTournirs() {
        Task {
            do {
                tournirs = try await fetchTournirs()
            } catch {
                tournirs = loadMockTournirs()
            }
        }
    }
    
    func fetchTournirs() async throws -> [Tournir] {
        let tournirEndpoint = TournirEndpoint()
        let tournirRequest = TournirRequest()

        let tournirResponses: [TournirDTO] = try await NetworkService.shared.request(
            endpoint: tournirEndpoint,
            requestDTO: tournirRequest
        )

        let mappedEvents = tournirResponses.map { dto -> Tournir in
            Tournir(title: dto.title, description: dto.description, sport: dto.sport, type_group: .round_robin, start_time: Date(), created_at: Date(), entry_cost: Double(dto.entryCost) ?? 0, is_team_based: true, max_participants: Int(dto.maxParticipants) ?? 0, organizer_id: UUID())
        }
        return mappedEvents
    }
    
    func loadMockTournirs() -> [Tournir] {
        let x = [
                Tournir(
                    title: "Чемпионат Москвы по футболу",
                    description: "Открытый турнир среди любительских команд",
                    sport: "Football",
                    type_group: .round_robin,
                    start_time: Date().addingTimeInterval(86400 * 7), // через неделю
                    created_at: Date(),
                    entry_cost: 1500.0,
                    is_team_based: true,
                    max_participants: 16,
                    organizer_id: UUID()
                ),
                Tournir(
                    title: "Кубок чемпионов по шахматам",
                    description: "Турнир с участием профессиональных игроков",
                    sport: "Chess",
                    type_group: .olympic,
                    start_time: Date().addingTimeInterval(86400 * 3), // через 3 дня
                    created_at: Date().addingTimeInterval(-86400 * 2),
                    entry_cost: 500.0,
                    is_team_based: false,
                    max_participants: 64,
                    organizer_id: UUID()
                ),
                Tournir(
                    title: "Летний теннисный кубок",
                    description: "Ежегодный турнир среди любителей и профессионалов",
                    sport: "Tennis",
                    type_group: .swiss,
                    start_time: Date().addingTimeInterval(86400 * 10),
                    created_at: Date().addingTimeInterval(-86400 * 5),
                    entry_cost: 2000.0,
                    is_team_based: false,
                    max_participants: 32,
                    organizer_id: UUID()
                ),
                Tournir(
                    title: "Киберспорт-чемпионат по Dota 2",
                    description: "Онлайн-турнир для киберспортивных команд",
                    sport: "CyberSport",
                    type_group: .round_robin,
                    start_time: Date().addingTimeInterval(86400 * 14),
                    created_at: Date().addingTimeInterval(-86400 * 10),
                    entry_cost: 0.0,
                    is_team_based: true,
                    max_participants: 8,
                    organizer_id: UUID()
                ),
                Tournir(
                    title: "Баскетбольная лига стартапов 12345678901234567890",
                    description: "Соревнование между командами IT-компаний",
                    sport: "Basketball",
                    type_group: .olympic,
                    start_time: Date().addingTimeInterval(86400 * 5),
                    created_at: Date().addingTimeInterval(-86400 * 3),
                    entry_cost: 1000.0,
                    is_team_based: true,
                    max_participants: 12,
                    organizer_id: UUID()
                )
            ]
        return x
    }
}
