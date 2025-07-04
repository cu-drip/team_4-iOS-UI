//
//  TournirCell.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirCell: View {
    var tournir: Tournir
    
    var body: some View {
        VStack {
            HStack {
                Text(tournir.title)
                    .lineLimit(1)
                Spacer()
                Text(tournir.sport)
            }
            .padding(.horizontal, 10)
            
            if tournir.entry_cost == 0 {
                            Text("Бесплатно")
                        } else {
                            Text("\(Int(tournir.entry_cost)) руб.")
                        }
            
        }
        .frame(width:400, height: 100)
        .background(.white)
        .cornerRadius(22)
    }
}


