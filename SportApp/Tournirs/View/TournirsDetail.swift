//
//  TournirsDetail.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirsDetail: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text(coordinator.currentTournir!.title)
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            Text(coordinator.currentTournir!.description)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            Text("Вид Спорта")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.bottom, 1)
            Text(coordinator.currentTournir!.sport)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            if coordinator.whoAreYou == .user {
                if !coordinator.currentTournir!.users.contains(where: { $0.id == coordinator.user!.id }) {
                    Button(action: {
                        coordinator.presentSheet(.registrationToTournir)
                    }, label: {
                        Text("Зарегестрироваться")
                            .padding()
                    })
                } else {
                    Text("Зарегестрироваться")
                        .padding()
                }
            }
            Spacer()
        }
        .padding(.top, 0)
    }
}
