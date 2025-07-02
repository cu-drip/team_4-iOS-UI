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
                Text("Кем будешь, путник?")
                    .padding(16)
                
                VStack {
                    Button(action: {
                        coordinator.presentSheet(.registration)
                        coordinator.whoAreYou = .user
                    }, label: {
                        Text("user")
                            .font(.title)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.black)
                            .background(Color.red)
                            .cornerRadius(12)
                    })
                    
                    Button(action: {
                        coordinator.presentSheet(.registration)
                        coordinator.whoAreYou = .admin
                    }, label: {
                        Text("admin")
                            .font(.title)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.black)
                            .background(Color.red)
                            .cornerRadius(12)
                    })
                }
                
                Spacer()
                    .frame(height: 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
