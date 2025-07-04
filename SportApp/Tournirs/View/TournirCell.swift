//
//  TournirCell.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirCell: View {
    var tournir: Tournir
    
    static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd.MM"
            return formatter
        }()
    
    var body: some View {
        VStack {
            HStack {
                Text(tournir.title)
                    .font(.system(size: 20, weight: .bold))
                    .lineLimit(1)
                    .padding(.trailing, 30)
                Spacer()
                Text(tournir.sport)
                    .font(.system(size: 20, weight: .medium))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 8)
            
            HStack {
                if tournir.entry_cost == 0 {
                    Text("Бесплатно")
                        .font(.system(size: 20, weight: .medium))
                } else {
                    Text("\(Int(tournir.entry_cost)) руб.")
                        .font(.system(size: 20, weight: .medium))
                }
                Spacer()
                Text(Self.dateFormatter.string(from: tournir.start_time))
                    .font(.system(size: 20, weight: .medium))
            }
            .padding(.horizontal, 15)
        }
        .frame(width:400, height: 100)
        .background(.white)
        .cornerRadius(22)
    }
}


