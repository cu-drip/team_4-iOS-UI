//
//  RegistrationView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Scatual()
                .padding(.top, 16)
            
            VStack {
                Text("Кто вы?")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(16)
                
                VStack {
                    Button(action: {
                        coordinator.presentSheet(.registration)
                        coordinator.whoAreYou = .user
                    }, label: {
                        Text("Пользователь")
                            .font(.system(size: 22))
                            .frame(width: 400, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(22)
                            .padding(.bottom, 5)
                    })
                    
                    Button(action: {
                        coordinator.presentSheet(.registration)
                        coordinator.whoAreYou = .admin
                    }, label: {
                        Text("Организатор")
                            .font(.system(size: 22))
                            .frame(width: 400, height: 50)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(22)
                            .padding(.bottom, 5)
                    })
                }
                
                Spacer()
                    .frame(height: 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
    }
}
