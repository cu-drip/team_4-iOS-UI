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
            VStack {
                Text(coordinator.currentTournir!.title)
                
                Text(coordinator.currentTournir!.description)
            }
            
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
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        //.toolbar(.hidden, for: .tabBar)
    }
}
