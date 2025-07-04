//
//  TournirMaker.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 04.07.2025.
//

import SwiftUI

struct TournirMaker: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: TournirsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.dismissSheet()
                }, label: {
                    Text("EXIT")
                        .padding(16)
                        .foregroundColor(.black)
                })
                
                Spacer()
            }
            
            VStack {
                Text("Make tournir")
                
                Button(action: {
                    viewModel.tournirs.append(Tournir(title: "TEST", description: "", sport: "Football", type_group: .olympic, start_time: Date(), created_at: Date(), entry_cost: 0, is_team_based: true, max_participants: 10, organizer_id: UUID()))
                    coordinator.dismissSheet()
                }, label: {
                    Text("COZDATb")
                        .padding(16)
                        .foregroundColor(.black)
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
