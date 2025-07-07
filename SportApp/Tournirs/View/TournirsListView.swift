//
//  ContentView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 01.07.2025.
//

import SwiftUI

struct TournirsListView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: TournirsViewModel

    var body: some View {
        VStack {
            HStack {
                if coordinator.user.isAdmin == true {
                    Text("   ")
                        .padding(16)
                }
                
                Scatual()
                    .frame(maxWidth: .infinity)
                
                if coordinator.user.isAdmin == true {
                    Button(action: {
                        coordinator.presentSheet(.tounirMaker)
                    }, label: {
                        Image(systemName: "plus")
                            .padding(16)
                            .foregroundColor(.black)
                    })
                }
            }
            .padding(.top, 16)
            
            ScrollView {
                ForEach(viewModel.tournirs, id: \.id) { tournir in
                    TournirCell(tournir: tournir)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 3)
                        .onTapGesture {
                            coordinator.currentTournir = tournir
                            coordinator.tournirListPath.append(tournir)
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
    }
}
