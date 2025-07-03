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
    
    @State var phio: String = ""
    @State var phoneNuber: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
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
                        .font(.system(size: 24, weight: .semibold))
                        .padding(16)
                } else {
                    Text("Регистрация")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(16)
                }
                
                if isLogInPressed {
                    TextField(" ФИО", text: $phio)
                        .padding()
                        .frame(width: 400, height: 50)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                TextField(" Номер телефона", text: $phoneNuber)
                    .padding()
                    .frame(width: 400, height: 50)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                
                SecureField(" Введите пароль", text: $password)
                    .padding()
                    .frame(width: 400, height: 50)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                
                if isLogInPressed {
                    TextField(" Подтвердите пароль", text: $passwordCheck)
                        .padding()
                        .frame(width: 400, height: 50)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                if !isLogInPressed {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Войти")
                    })
                } else {
                    Button(action: {
                        if password == passwordCheck {
                            dismiss()
                        }
                    }, label: {
                        Text("Зарегестрировать")
                    })
                }
                
                if !isLogInPressed {
                    Button(action: {
                        isLogInPressed.toggle();
                    }, label: {
                        Text("Зарегестрироваться")
                            .padding()
                    })
                } else {
                    Button(action: {
                        isLogInPressed.toggle();
                    }, label: {
                        Text("Войти")
                            .padding()
                    })
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
    }
    
    
    func dismiss() {
        switch coordinator.whoAreYou {
        case .user:
            coordinator.user = User(phio: phio, phone: phoneNuber, password: password)
        case .admin:
            coordinator.admin = Admin(phio: phio, phone: phoneNuber, password: password)
        case .none:
            break
        }
        coordinator.dismissSheet()
        isAuthenticated = true
    }
}
