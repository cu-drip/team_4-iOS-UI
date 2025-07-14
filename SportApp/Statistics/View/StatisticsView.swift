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
            Text("Статистика")
                .font(.system(size: 24, weight: .bold))
                .padding(.leading, 20)
                .padding(.bottom, 32)
            
            ScrollView {
                ForEach(TournirInstantState.list, id: \.id) { state in
                    VStack {
                        Text(TournirInstantState.toString(state))
                            .font(.system(size: 24, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        Rectangle()
                            .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .frame(height: 1)
                            .padding(.horizontal, 12)
                        
                        ForEach(tournirs, id: \.id) { tournir in
                            if tournir.tournirInstanteState == state {
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
