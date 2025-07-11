//
//  TournirsDetail.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirsDetail: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = ParticipantsViewModel()
    
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
            
            
            List {
                HStack {
                    Text("Участники")
                        .padding(.leading)
                    
                    Spacer()
                }
                ScrollView {
                    ForEach(viewModel.participants, id: \.id) { participant in
                        Text(participant.name)
                            .padding()
                    }
                }
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
            }
            Spacer()
        }
        .navigationTitle("О соревновании")
        .onAppear() {
            viewModel.loadParticipants(for: coordinator.currentTournir!.id.uuidString)
        }

    }
}
