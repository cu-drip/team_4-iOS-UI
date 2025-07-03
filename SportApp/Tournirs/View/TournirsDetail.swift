//
//  TournirsDetail.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirsDetail: View {
    @EnvironmentObject var coordinator: Coordinator
    var tournir: Tournir
    
    var body: some View {
        VStack {
            VStack {
                Text(tournir.title)
                
                Text(tournir.description)
            }
            
            Button(action: {
                coordinator.currentSport = Sport.fromString(tournir.sport)
                coordinator.presentSheet(.registrationToTournir)
                coordinator.currentTournir = tournir
            }, label: {
                Text("Зарегестрироваться")
                    .padding()
            })
            //.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        //.toolbar(.hidden, for: .tabBar)
    }
}
