//
//  ProfileView.swift
//  SportApp
//
//  Created by user on 07.07.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Профиль")
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding(.top, 20)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            Text("Контакты")
                .font(.system(size: 24, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Телефон")
                .font(.system(size: 21, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
            if let phoneNumber = coordinator.user.phone {
                Text(phoneNumber)
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            } else {
                Text("12345678932")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            }
            
            Text("Email")
                .font(.system(size: 21, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
            Text(coordinator.user.email)
                .font(.system(size: 21, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Пароль")
                .font(.system(size: 21, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
            Text(coordinator.user.password)
                .font(.system(size: 21, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            Rectangle()
                .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(height: 1)
                .padding(.horizontal, 12)
            
            Text("Личные данные")
                .font(.system(size: 24, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            Text("ФИО")
            Text("Пол")
            Text("Дата рождения")
            Text("Возраст")
            Text("Характеристики")
            Text("Описание")
            Spacer()
        }
    }
}
