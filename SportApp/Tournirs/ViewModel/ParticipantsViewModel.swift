//
//  ParticipantsViewModel.swift
//  SportApp
//
//  Created by user on 09.07.2025.
//

import Foundation
import Combine

@MainActor
class ParticipantsViewModel: ObservableObject {
    @Published var participants: [User] = []
    @Published var axoroms: [PairAxoroms] = []
    
    var winner: User? {
        if axoroms.count == 1 {
            return axoroms[0].isFirstWinner! ? axoroms[0].first : axoroms[0].second
        } else {
            return nil
        }
    }
    
    func loadParticipants(for tournamentID: String) {
        Task {
            do {
                participants = try await fetchParticipants(tournamentID: tournamentID)
                print(participants)
            } catch {
                print(error)
            }
        }
    }
    
    func fetchParticipants(tournamentID: String) async throws -> [User] {
        let participantEndpoint = ParticipantEndpoint(tournamentID: tournamentID)
        let participantRequest = ParticipantRequest()
        
        var participantResponses = [UserDTO]()
        participantResponses = try await NetworkService.shared.request(
            endpoint: participantEndpoint,
            requestDTO: participantRequest
        )
        
        return participantResponses.map { User(dto: $0) }
    }
    
    func setParticipants() {
        participants = [
            User(
                id: UUID(),
                phio: "Иванов Иван",
                phone: "+79001234567",
                password: "pass123",
                email: "ivanov@example.com",
                dateOfBirth: Date().addingTimeInterval(-25 * 365 * 86400),
                age: 25,
                sexIsMan: true,
                weight: 75.5,
                height: 180.0,
                mmr: 1500.0,
                bio: "Профессиональный игрок в CS:GO.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Петров Петр",
                phone: "+79007654321",
                password: "pass123",
                email: "petrov@example.com",
                dateOfBirth: Date().addingTimeInterval(-28 * 365 * 86400),
                age: 28,
                sexIsMan: true,
                weight: 80.0,
                height: 185.0,
                mmr: 1450.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Смирнова Ольга",
                phone: nil,
                password: "pass123",
                email: "smirnova@example.com",
                dateOfBirth: Date().addingTimeInterval(-22 * 365 * 86400),
                age: 22,
                sexIsMan: false,
                weight: 60.0,
                height: 170.0,
                mmr: 1300.0,
                bio: "Любитель шахмат и настольных игр.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Кузнецов Алексей",
                phone: "+79012345678",
                password: "pass123",
                email: "kuznetsov@example.com",
                dateOfBirth: Date().addingTimeInterval(-30 * 365 * 86400),
                age: 30,
                sexIsMan: true,
                weight: 90.0,
                height: 190.0,
                mmr: 1600.0,
                bio: "Мастер по Dota 2.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Соколов Дмитрий",
                phone: nil,
                password: "pass123",
                email: "sokolov@example.com",
                dateOfBirth: Date().addingTimeInterval(-19 * 365 * 86400),
                age: 19,
                sexIsMan: true,
                weight: 70.0,
                height: 175.0,
                mmr: 1200.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Попова Екатерина",
                phone: "+79011122334",
                password: "pass123",
                email: "popova@example.com",
                dateOfBirth: Date().addingTimeInterval(-24 * 365 * 86400),
                age: 24,
                sexIsMan: false,
                weight: 55.0,
                height: 165.0,
                mmr: 1350.0,
                bio: "Увлекаюсь киберспортом и программированием.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Васильев Максим",
                phone: "+79022233445",
                password: "pass123",
                email: "vasilev@example.com",
                dateOfBirth: Date().addingTimeInterval(-27 * 365 * 86400),
                age: 27,
                sexIsMan: true,
                weight: 85.0,
                height: 188.0,
                mmr: 1400.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Алексеева Наталья",
                phone: nil,
                password: "pass123",
                email: "alekseeva@example.com",
                dateOfBirth: Date().addingTimeInterval(-23 * 365 * 86400),
                age: 23,
                sexIsMan: false,
                weight: 62.0,
                height: 172.0,
                mmr: 1250.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Михайлов Андрей",
                phone: "+79033344556",
                password: "pass123",
                email: "mikhailov@example.com",
                dateOfBirth: Date().addingTimeInterval(-26 * 365 * 86400),
                age: 26,
                sexIsMan: true,
                weight: 78.0,
                height: 178.0,
                mmr: 1550.0,
                bio: "Профессиональный игрок в League of Legends.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Новикова Татьяна",
                phone: "+79044455667",
                password: "pass123",
                email: "novikova@example.com",
                dateOfBirth: Date().addingTimeInterval(-21 * 365 * 86400),
                age: 21,
                sexIsMan: false,
                weight: 58.0,
                height: 168.0,
                mmr: 1320.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Федоров Сергей",
                phone: nil,
                password: "pass123",
                email: "fedorov@example.com",
                dateOfBirth: Date().addingTimeInterval(-29 * 365 * 86400),
                age: 29,
                sexIsMan: true,
                weight: 82.0,
                height: 183.0,
                mmr: 1480.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Егорова Полина",
                phone: "+79055566778",
                password: "pass123",
                email: "egorova@example.com",
                dateOfBirth: Date().addingTimeInterval(-20 * 365 * 86400),
                age: 20,
                sexIsMan: false,
                weight: 57.0,
                height: 167.0,
                mmr: 1280.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Беляев Роман",
                phone: "+79066677889",
                password: "pass123",
                email: "belyaev@example.com",
                dateOfBirth: Date().addingTimeInterval(-31 * 365 * 86400),
                age: 31,
                sexIsMan: true,
                weight: 88.0,
                height: 192.0,
                mmr: 1620.0,
                bio: "Опытный игрок в Apex Legends.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Комарова Анна",
                phone: nil,
                password: "pass123",
                email: "komarova@example.com",
                dateOfBirth: Date().addingTimeInterval(-22 * 365 * 86400),
                age: 22,
                sexIsMan: false,
                weight: 59.0,
                height: 170.0,
                mmr: 1310.0,
                bio: nil,
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Орлов Виталий",
                phone: "+79077788990",
                password: "pass123",
                email: "orlov@example.com",
                dateOfBirth: Date().addingTimeInterval(-33 * 365 * 86400),
                age: 33,
                sexIsMan: true,
                weight: 92.0,
                height: 195.0,
                mmr: 1700.0,
                bio: "Тренер по киберспорту.",
                isAdmin: false
            ),
            User(
                id: UUID(),
                phio: "Лазарева Юлия",
                phone: "+79088899001",
                password: "pass123",
                email: "lazareva@example.com",
                dateOfBirth: Date().addingTimeInterval(-24 * 365 * 86400),
                age: 24,
                sexIsMan: false,
                weight: 61.0,
                height: 173.0,
                mmr: 1370.0,
                bio: nil,
                isAdmin: false
            )
        ]
    }
    
    func setAxoroms() {
        axoroms.removeAll()

        guard !participants.isEmpty else { return }

        for i in stride(from: 0, to: participants.count, by: 2) {
            guard i + 1 < participants.count else {
                break
            }
            let pair = PairAxoroms(first: participants[i], second: participants[i + 1])
            axoroms.append(pair)
        }
    }
    
    func remakeAxoroms() {
        if axoroms.count == 1 { return }
        var axoromss: [PairAxoroms] = []
        for i in stride(from: 0, to: axoroms.count, by: 2) {
            guard i + 1 < axoroms.count else {
                break
            }
            let first = axoroms[i].isFirstWinner! ? axoroms[i].first : axoroms[i].second
            let second = axoroms[i+1].isFirstWinner! ? axoroms[i+1].first : axoroms[i+1].second
            let pair = PairAxoroms(first: first, second: second)
            axoromss.append(pair)
        }
        axoroms = axoromss
    }
/*
    func giveParticipant(participant: Participant) {
        Task {
            let participantEndpoint = ParticipantPostEndpoint()
            let participantRequest = ParticipantPostRequest(participant: participant)
            
            do {
                let respone: ParticipantDTO = try await NetworkService.shared.request(
                    endpoint: participantEndpoint,
                    requestDTO: participantRequest
                )
                print(син)
            } catch {
                print(error)
            }
        }

 */

}

