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
            HStack {
                Button(action: {
                    coordinator.dismissSheet()
                }, label: {
                    Text("EXIT")
                        .padding(16)
                        .foregroundColor(.black)
                })
                
                Spacer()
            }
            
            VStack {
                Text(tournir.title)
                
                Text(tournir.description)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
