//
//  TournirRegistration.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirRegistration: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
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
            Text("1234567890")
            
            Button(action: {
                coordinator.registratateUser()
            }, label: {
                Text("Зарегестрироваться")
                    .padding()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
