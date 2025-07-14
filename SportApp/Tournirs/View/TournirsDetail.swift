//
//  TournirsDetail.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirsDetail: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel2: TournirsViewModel
    @StateObject var viewModel = ParticipantsViewModel()
    
    @State var matchs: Int = 0
    @State var participants: [User] = []
    
    var body: some View {
        VStack {
            Text(coordinator.currentTournir!.title)
                .font(.system(size: 26, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            Text(coordinator.currentTournir!.description)
                .font(.system(size: 21, weight: .medium))
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            HStack {
                VStack{
                    Text("Вид Спорта")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                    Text(coordinator.currentTournir!.sport)
                        .font(.system(size: 21, weight: .medium))
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                }
                Spacer()
                VStack {
                    Text("Стоимость")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                    if coordinator.currentTournir!.entry_cost == 0 {
                        Text("Бесплатно")
                            .font(.system(size: 21, weight: .medium))
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                    } else {
                        Text("\(Int(coordinator.currentTournir!.entry_cost)) руб.")
                            .font(.system(size: 21, weight: .medium))
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                    }
                }

            }
            
            Rectangle()
                .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(height: 1)
                .padding(.horizontal, 12)
            
            if coordinator.currentTournir!.tournirInstanteState != .openedRegistrationTournaments {
                scale
            } else {
                participantsView
            }
            
            if coordinator.user.isAdmin == false {
                if !coordinator.currentTournir!.users.contains(where: { $0.id == coordinator.user.id }) {
                    Button(action: {
                        coordinator.presentSheet(.registrationToTournir)
                    }, label: {
                        Text("Зарегистрироваться")
                            .padding()
                    })
                } else {
                    Text("Зарегистрироваться")
                        .padding()
                }
            } else {
                if coordinator.currentTournir!.tournirInstanteState == .ongoingTournaments || coordinator.currentTournir!.tournirInstanteState == .endedTournaments {
                    Text(coordinator.currentTournir!.tournirInstanteState.rawValue)
                        .padding()
                } else {
                    Button(action: {
                        updateInstanceState()
                    }, label: {
                        Text(coordinator.currentTournir!.tournirInstanteState.rawValue)
                            .padding()
                    })
                    .disabled(coordinator.currentTournir!.organizer_id != coordinator.user.id)
                }
            }
            Spacer()
        }
        .navigationTitle("О соревновании")
        .onAppear() {
            //viewModel.loadParticipants(for: coordinator.currentTournir!.id.uuidString)
            matchs = coordinator.currentTournir!.matchs
            viewModel.setParticipants()
            viewModel.setAxoroms()
            if let index = viewModel2.tournirs.firstIndex(where: { $0.id == coordinator.currentTournir!.id }) {
                // починить подгрузку турнира
                coordinator.currentTournir!.winner = viewModel2.tournirs[index].winner
            }
        }
    }
    
    private func updateInstanceState() {
        guard var currentTournir = coordinator.currentTournir else {
            return
        }
        
        let newState = TournirInstantState.nextState(currentTournir.tournirInstanteState)
        
        if let index = viewModel2.tournirs.firstIndex(where: { $0.id == currentTournir.id }) {
            viewModel2.tournirs[index].tournirInstanteState = newState
        }
        
        currentTournir.tournirInstanteState = newState
        coordinator.currentTournir = currentTournir
    }
    
    private func updateWinner() {
        guard var currentTournir = coordinator.currentTournir else {
            return
        }
        
        guard let newState = viewModel.winner else {
            return
        }
        
        if let index = viewModel2.tournirs.firstIndex(where: { $0.id == currentTournir.id }) {
            viewModel2.tournirs[index].winner = newState
        }
        
        currentTournir.winner = newState
        coordinator.currentTournir = currentTournir
    }
    
    var scale: some View {
        Group {
            if coordinator.currentTournir!.currentMatch < matchs && coordinator.currentTournir!.winner == nil {
                VStack {
                    HStack {
                        ForEach(0..<matchs, id: \.self) { match in
                            let roundNumber = Int(pow(2.0, Double(self.matchs - match - 1)))
                            let title = self.getTitle(for: roundNumber)
                            Spacer()
                            
                            Text(title)
                                .frame(width: 80, height: 30)
                                .background(match == coordinator.currentTournir!.currentMatch ? Color.green : Color.gray)
                                .cornerRadius(10)
                            
                            Spacer()
                        }
                    }
                    
                    ScrollView {
                        ForEach(viewModel.axoroms, id: \.id) { axoroms in
                            VStack {
                                HStack {
                                    Text(axoroms.first.phio)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        if let index = viewModel.axoroms.firstIndex(of: axoroms) {
                                            viewModel.axoroms[index].isFirstWinner = true
                                        }
                                    }) {
                                        if let index = viewModel.axoroms.firstIndex(of: axoroms) {
                                            Image(systemName: (viewModel.axoroms[index].isFirstWinner ?? false) ? "checkmark.square" : "square")
                                        } else {
                                            Image(systemName: "square")
                                        }
                                    }
                                    .disabled(!coordinator.user.isAdmin || coordinator.currentTournir!.tournirInstanteState == .closedRegistrationTournaments || coordinator.currentTournir!.tournirInstanteState == .endedTournaments)
                                }
                                
                                Rectangle()
                                    .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                                    .frame(width: 375, height: 1)
                                
                                HStack {
                                    Text(axoroms.second.phio)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        if let index = viewModel.axoroms.firstIndex(of: axoroms) {
                                            viewModel.axoroms[index].isFirstWinner = false
                                        }
                                    }) {
                                        if let index = viewModel.axoroms.firstIndex(of: axoroms) {
                                            Image(systemName: !(viewModel.axoroms[index].isFirstWinner ?? true) ? "checkmark.square" : "square")
                                        } else {
                                            Image(systemName: "square")
                                        }
                                    }
                                    .disabled(!coordinator.user.isAdmin || coordinator.currentTournir!.tournirInstanteState == .closedRegistrationTournaments || coordinator.currentTournir!.tournirInstanteState == .endedTournaments)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        
                        Button("Далее") {
                            var c = 0
                            for i in viewModel.axoroms {
                                if i.isFirstWinner != nil {
                                    c += 1
                                }
                            }
                            if c == viewModel.axoroms.count {
                                coordinator.currentTournir!.currentMatch += 1
                                viewModel.remakeAxoroms()
                            }
                            if coordinator.currentTournir!.currentMatch >= matchs {
                                updateInstanceState()
                                updateWinner()
                            }
                        }
                        .disabled(!coordinator.user.isAdmin || coordinator.currentTournir!.tournirInstanteState == .closedRegistrationTournaments || coordinator.currentTournir!.tournirInstanteState == .endedTournaments)
                    }
                }
            } else {
                VStack {
                    if let winner = coordinator.currentTournir!.winner {
                        Text("Победитель \(winner.phio)")
                    } else {
                        Text("У вас недостаточно участников для начала соревнования")
                    }
                }
            }
        }
    }
    
    private func getTitle(for number: Int) -> String {
        switch number {
        case 1:
            return "Финал"
        default:
            return "1/\(number)"
        }
    }
    
    var participantsView: some View {
        List {
            HStack{
                Spacer()
                Text("Участники")
                Spacer()
            }
            ScrollView {
                ForEach(viewModel.participants, id: \.id) { participant in
                    HStack {
                        Text(participant.phio)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}
