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
        //tournirs = loadMockTournirs()
        loadTournirs()
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
        
        var tournirResponses = [TournirDTO]()

        tournirResponses = try await NetworkService.shared.request(
            endpoint: tournirEndpoint,
            requestDTO: tournirRequest
        )
            
        let mappedEvents = tournirResponses.map { dto -> Tournir in
            Tournir(title: dto.title ?? "Unnamed", description: dto.description ?? "", sport: dto.sport ?? "Chess", type_group: .round_robin, start_time: Date(), created_at: Date(), entry_cost: Double(dto.entryCost ?? 0), is_team_based: true, place: dto.place ?? "", max_participants: Int(dto.maxParticipants ?? 0), organizer_id: UUID(), requirements: Requirements())
        }
        return mappedEvents
    }
    
    func giveTournir(tournir: Tournir) {
        Task {
            let tournirEndpoint = TournirPostEndpoint()
            let tournirRequest = TournirDTO(tournir: tournir)
            
            do {
                let respone: TournirDTO = try await NetworkService.shared.request(
                    endpoint: tournirEndpoint,
                    requestDTO: tournirRequest
                )
                print(respone)
            } catch {
                print(error)
            }
        }
    }
    
    func loadMockTournirs() -> [Tournir] {
        let x = [
                Tournir(
                    title: "Турнир Траекторий",
                    description: "Турнир по мини-футболу в формате 1 на 1 проводится среди студентов в рамках внутриуниверситетских спортивных мероприятий. Цель — популяризация активного образа жизни и развитие навыков индивидуальной игры: контроля мяча, скорости реакции и точности завершения атак.",
                    sport: "football",
                    type_group: .round_robin,
                    start_time: Date().addingTimeInterval(86400 * 7), // через неделю
                    created_at: Date(),
                    entry_cost: 1500.0,
                    is_team_based: true,
                    place: "",
                    max_participants: 16,
                    organizer_id: UUID(),
                    requirements: Requirements()
                ),
                Tournir(
                    title: "Кубок чемпионов по шахматам",
                    description: "Турнир с участием профессиональных игроков",
                    sport: "chess",
                    type_group: .olympic,
                    start_time: Date().addingTimeInterval(86400 * 3), // через 3 дня
                    created_at: Date().addingTimeInterval(-86400 * 2),
                    entry_cost: 500.0,
                    is_team_based: false,
                    place: "",
                    max_participants: 64,
                    organizer_id: UUID(),
                    requirements: Requirements()
                ),
                Tournir(
                    title: "Летний теннисный кубок",
                    description: "Ежегодный турнир среди любителей и профессионалов",
                    sport: "tennis",
                    type_group: .swiss,
                    start_time: Date().addingTimeInterval(86400 * 10),
                    created_at: Date().addingTimeInterval(-86400 * 5),
                    entry_cost: 2000.0,
                    is_team_based: false,
                    place: "",
                    max_participants: 32,
                    organizer_id: UUID(),
                    requirements: Requirements()
                ),
                Tournir(
                    title: "Киберспорт-чемпионат по Dota 2",
                    description: "Онлайн-турнир для киберспортивных команд",
                    sport: "cyberSport",
                    type_group: .round_robin,
                    start_time: Date().addingTimeInterval(86400 * 14),
                    created_at: Date().addingTimeInterval(-86400 * 10),
                    entry_cost: 0.0,
                    is_team_based: true,
                    place: "",
                    max_participants: 8,
                    organizer_id: UUID(),
                    requirements: Requirements()
                ),
                Tournir(
                    title: "Баскетбольная лига стартапов",
                    description: "Соревнование между командами IT-компаний",
                    sport: "basketball",
                    type_group: .olympic,
                    start_time: Date().addingTimeInterval(86400 * 5),
                    created_at: Date().addingTimeInterval(-86400 * 3),
                    entry_cost: 1000.0,
                    is_team_based: true,
                    place: "",
                    max_participants: 12,
                    organizer_id: UUID(),
                    requirements: Requirements()
                )
            ]
        return x
    }
}
