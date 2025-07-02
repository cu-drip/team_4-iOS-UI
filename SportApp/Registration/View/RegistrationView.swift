//
//  RegistrationView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var coordinator: Coordinator
//    @Binding var isAuthenticated: Bool
    
    var body: some View {
        VStack {
            Scatual()
                .padding(.top, 16)
            
            VStack {
                Text("RegistrationView")
                
                Button(action: {
                    coordinator.presentSheet(.registration)
                    coordinator.whoAreYou = .user
                }, label: {
                    Text("user")
                })
                
                Button(action: {
                    coordinator.presentSheet(.registration)
                    coordinator.whoAreYou = .admin
                }, label: {
                    Text("admin")
                })
                
                Spacer()
                    .frame(height: 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
