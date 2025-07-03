//
//  TournirRegistration.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirRegistration: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: TournirsViewModel

    var body: some View {
        HStack {
            Button(action: {
                coordinator.presentedSheet = nil
                coordinator.currentSport = nil
            }, label: {
                Text("EXIT")
                    .padding(16)
                    .foregroundColor(.black)
            })
            
            Spacer()
        }
        
        VStack {
            Text("1234567890")
            
            Button(action: {
                if coordinator.currentTournir == nil{
                    return
                }
                if let index = viewModel.tournirs.firstIndex(of: coordinator.currentTournir!) {
                    // Удаляем и вставляем на то же место
                    viewModel.tournirs.remove(at: index)
                    coordinator.registratateUser()
                    viewModel.tournirs.insert(coordinator.currentTournir!, at: index)
                } else {
                    coordinator.registratateUser()
                }
                coordinator.presentedSheet = nil
                coordinator.currentSport = nil
                //viewModel.tournirs.
            }, label: {
                Text("Зарегестрироваться")
                    .padding()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
