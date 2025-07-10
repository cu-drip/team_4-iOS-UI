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
    @Published var participants: [ParticipantDTO] = []
    
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
    
    func fetchParticipants(tournamentID: String) async throws -> [ParticipantDTO] {
        let participantEndpoint = ParticipantEndpoint(tournamentID: tournamentID)
        let participantRequest = ParticipantRequest()
        
        var participantResponses = [ParticipantDTO]()
        participantResponses = try await NetworkService.shared.request(
            endpoint: participantEndpoint,
            requestDTO: participantRequest
        )
        
        return participantResponses
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
                print(respone)
            } catch {
                print(error)
            }
        }

 */

}

