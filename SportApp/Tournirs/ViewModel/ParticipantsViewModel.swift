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
    @Published var participants: [UserDTO] = []
    
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
    
    func fetchParticipants(tournamentID: String) async throws -> [UserDTO] {
        let participantEndpoint = ParticipantEndpoint(tournamentID: tournamentID)
        let participantRequest = ParticipantRequest()
        
        var participantResponses = [UserDTO]()
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
                print(син)
            } catch {
                print(error)
            }
        }

 */

}

