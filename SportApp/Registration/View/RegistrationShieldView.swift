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
    @State var isLogInPressed = false
    
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
                if !isLogInPressed {
                    Text("Войти в аккаунт")
                } else {
                    Text("Регистрация")
                }
                
                TextField("Номер телефона", text: $phoneNuber)
                    .padding()
                    .frame(width: 400, height: 50)
                    .border(Color.black)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .frame(width: 400, height: 50)
                    .border(Color.black)
                
                if isLogInPressed {
                    TextField("Подтвердите пароль", text: $phoneNuber)
                        .padding()
                        .frame(width: 400, height: 50)
                        .border(Color.black)
                }
                
                if !isLogInPressed {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Войти")
                    })
                } else {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Зарегестрировать")
                    })
                }
                
                Button(action: {
                    isLogInPressed.toggle();
                }, label: {
                    Text("Зарегестрироваться")
                        .padding()
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
