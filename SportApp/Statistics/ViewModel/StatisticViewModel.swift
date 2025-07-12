//
//  StatisticViewModel.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 11.07.2025.
//

import Foundation
import Combine

class StatisticViewModel: ObservableObject {
    @Published var allTournirs: [Tournir] = []
    @Published var user: User = User(id: UUID(), phio: "", password: "", email: "", isAdmin: false)

    private var cancellables = Set<AnyCancellable>()

    init(tournirsVM: TournirsViewModel, coordinator: Coordinator) {
        coordinator.$user
            .assign(to: \.user, on: self)
            .store(in: &cancellables)
        
        tournirsVM.$tournirs
            .assign(to: \.allTournirs, on: self)
            .store(in: &cancellables)
    }
    
    func tournirs4User() -> [Tournir] {
        let mockTournirs: [Tournir] = [
            // 1. Прошедший турнир
            Tournir(
                id: UUID(),
                title: "Cупер кубок 2023",
                description: "Главный футбольный турнир года, прошедший в Москве.",
                sport: "Футбол",
                type_group: .olympic,
                type_tournir: .team,
                start_time: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                created_at: Calendar.current.date(byAdding: .month, value: -6, to: Date())!,
                entry_cost: 0.0,
                is_team_based: true,
                place: "Стадион 'Динамо', Москва",
                max_participants: 32,
                organizer_id: UUID(),
                users: [user],
                requirements: Requirements(),
                tournirInstaseState: .endedTournaments
            ),

            // 2. Турнир идёт
            Tournir(
                id: UUID(),
                title: "Чемпионат города",
                description: "Ежегодный баскетбольный чемпионат среди любительских команд.",
                sport: "Баскетбол",
                type_group: .olympic,
                type_tournir: .team,
                start_time: Calendar.current.date(byAdding: .hour, value: -2, to: Date())!,
                created_at: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
                entry_cost: 500.0,
                is_team_based: true,
                place: "Спортивный зал 'Арена'",
                max_participants: 16,
                organizer_id: UUID(),
                users: [user],
                requirements: Requirements(),
                tournirInstaseState: .ongoingTournaments
            ),

            // 3. Регистрация закрыта
            Tournir(
                id: UUID(),
                title: "Турнир чемпионов",
                description: "Волейбольный турнир для профессиональных клубов.",
                sport: "Волейбол",
                type_group: .olympic,
                type_tournir: .team,
                start_time: Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
                created_at: Calendar.current.date(byAdding: .month, value: -4, to: Date())!,
                entry_cost: 1000.0,
                is_team_based: true,
                place: "Крытый спортивный комплекс",
                max_participants: 8,
                organizer_id: UUID(),
                users: [user],
                requirements: Requirements(),
                tournirInstaseState: .closedRegistrationTournaments
            ),

            // 4. Регистрация открыта
            Tournir(
                id: UUID(),
                title: "Молодёжный кубок",
                description: "Хоккейный турнир для молодых игроков до 21 года.",
                sport: "Хоккей",
                type_group: .olympic,
                type_tournir: .team,
                start_time: Calendar.current.date(byAdding: .weekOfYear, value: 2, to: Date())!,
                created_at: Calendar.current.date(byAdding: .month, value: -1, to: Date())!,
                entry_cost: 200.0,
                is_team_based: true,
                place: "Ледовая арена 'Звезда'",
                max_participants: 12,
                organizer_id: UUID(),
                users: [user],
                requirements: Requirements(),
                tournirInstaseState: .openedRegistrationTournaments
            )
        ]
        return mockTournirs
    }
    
    func tournirs4Admin() -> [Tournir] {
        allTournirs.filter { $0.organizer_id == user.id }
    }
}
