//
//  StatisticsView.swift
//  SportApp
//
//  Created by user on 11.07.2025.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModelOfStatistic: StatisticViewModel
    @State var tournirs: [Tournir] = []

    init(viewModelOfStatistic: StatisticViewModel) {
        _viewModelOfStatistic = StateObject(wrappedValue: viewModelOfStatistic)
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("openedRegistrationTournaments")
                    
                    ForEach(tournirs, id: \.id) { tournir in
                        if tournir.tournirInstaseState == .openedRegistrationTournaments {
                            TournirCell(tournir: tournir)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 3)
                                .onTapGesture {
                                    coordinator.tournirListPath = NavigationPath()
                                    coordinator.currentTournir = tournir
                                    coordinator.statListPath.append(tournir)
                                }
                        }
                    }
                }
                
                VStack {
                    Text("closedRegistrationTournaments")
                    
                    ForEach(tournirs, id: \.id) { tournir in
                        if tournir.tournirInstaseState == .closedRegistrationTournaments {
                            TournirCell(tournir: tournir)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 3)
                                .onTapGesture {
                                    coordinator.tournirListPath = NavigationPath()
                                    coordinator.currentTournir = tournir
                                    coordinator.statListPath.append(tournir)
                                }
                        }
                    }
                }
                
                VStack {
                    Text("ongoingTournaments")
                    
                    ForEach(tournirs, id: \.id) { tournir in
                        if tournir.tournirInstaseState == .ongoingTournaments {
                            TournirCell(tournir: tournir)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 3)
                                .onTapGesture {
                                    coordinator.tournirListPath = NavigationPath()
                                    coordinator.currentTournir = tournir
                                    coordinator.statListPath.append(tournir)
                                }
                        }
                    }
                }
                
                VStack {
                    Text("pastTournament")
                    
                    ForEach(tournirs, id: \.id) { tournir in
                        if tournir.tournirInstaseState == .pastTournament {
                            TournirCell(tournir: tournir)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 3)
                                .onTapGesture {
                                    coordinator.tournirListPath = NavigationPath()
                                    coordinator.currentTournir = tournir
                                    coordinator.statListPath.append(tournir)
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            if coordinator.user.isAdmin == true {
                tournirs = viewModelOfStatistic.tournirs4Admin()
            } else {
                tournirs = viewModelOfStatistic.tournirs4User()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
    }
}
