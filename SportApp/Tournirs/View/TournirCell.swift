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
            Text(tournir.title)
        }
        .frame(width:400, height: 100)
        .background(.white)
        .cornerRadius(22)
        //.border(.red)
        //.background(.white)
    }
}
