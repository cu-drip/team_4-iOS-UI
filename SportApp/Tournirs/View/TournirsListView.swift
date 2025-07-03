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
            Scatual()
                .padding(.top, 16)
            
            ScrollView {
                ForEach(viewModel.tournirs, id: \.id) { tournir in
                    TournirCell(tournir: tournir)
                        .padding(16)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
}
