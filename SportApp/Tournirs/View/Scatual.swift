//
//  Scatual.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

public struct Scatual: View {
    public var body: some View {
        HStack {
            Text("Ж")
                .foregroundColor(.red)
            
            Text("Ы")
                .foregroundColor(.blue)
            
            Text("Ж")
                .foregroundColor(.red)
            
            Text("А")
                .foregroundColor(.red)
        }
        .font(.system(size: 40, weight: .bold))
        .lineLimit(1)
        .frame(height: 40)
        .padding(16)
    }
}
