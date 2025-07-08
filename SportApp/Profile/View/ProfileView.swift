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
            
            HStack {
                VStack {
                    Text("ФИО")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    Text(coordinator.user.phio)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }
                
                VStack {
                    Text("Пол")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    if let sex = coordinator.user.sexIsMan {
                        Text("\(sex ? "Мужской" : "Женский")")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    } else {
                        Text("Не указан")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    }
                }
            }
            
            VStack {
                Text("Возраст")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                if let age = coordinator.user.age {
                    Text("\(age)")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    Text("Не указан")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }
            }
            
            Rectangle()
                .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(height: 1)
                .padding(.horizontal, 12)
            
            Text("Характеристики")
                .font(.system(size: 24, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            HStack {
                VStack {
                    Text("ММР")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    if let mmr = coordinator.user.mmr {
                        Text(String(format: "%.0f", mmr))
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    } else {
                        Text("-")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    }
                }
                
                VStack {
                    Text("Рост")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    if let height = coordinator.user.height {
                        Text("\(Int(height)) см")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    } else {
                        Text("-")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    }
                }
                
                VStack {
                    Text("Вес")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    if let weight = coordinator.user.weight {
                        Text("\(Int(weight)) кг")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    } else {
                        Text("-")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                    }
                }
            }
            
            Rectangle()
                .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                .frame(height: 1)
                .padding(.horizontal, 12)
            
            Text("Описание")
                .font(.system(size: 24, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                .padding(.horizontal, 20)
            if let bio = coordinator.user.bio, !bio.isEmpty {
                Text(bio)
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            } else {
                Text("Не указано")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            }
            
            Spacer()
        }
    }
}


//#Preview {
    //ProfileView()
        //.environmentObject(Coordinator())
//}
