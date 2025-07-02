//
//  Untitled.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct RegistrationShieldView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var isAuthenticated: Bool
    
    @State var phoneNuber: String = ""
    @State var password: String = ""
    
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
                Text("Войти в аккаунт")
                
                TextField("Номер телефона", text: $phoneNuber)
                    .padding()
                    .frame(width: 400, height: 50)
                    .border(Color.black)
                
                SecureField("Пароль", text: $password)
                    .padding()
                    .frame(width: 400, height: 50)
                    .border(Color.black)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Войти")
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    
    func dismiss() {
        switch coordinator.whoAreYou {
        case .user:
            coordinator.user = User(phone: phoneNuber, password: password)
        case .admin:
            coordinator.admin = Admin(phone: phoneNuber, password: password)
        case .none:
            break
        }
        coordinator.dismissSheet()
        isAuthenticated = true
    }
}
