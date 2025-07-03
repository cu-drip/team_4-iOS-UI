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
        Text(tournir.title)
    }
}
