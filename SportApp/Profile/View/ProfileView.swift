import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("Профиль")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                }
                
                Text("Контакты")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                // Телефон
                Text("Телефон")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                if isEditing {
                    TextField("Телефон", text: Binding(
                        get: { coordinator.user.phone ?? "" },
                        set: { coordinator.user.phone = $0 }
                    ))
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .keyboardType(.phonePad)
                } else {
                    Text(coordinator.user.phone ?? "12345678932")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }
                
                // Email
                Text("Email")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                if isEditing {
                    TextField("Email", text: $coordinator.user.email)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                } else {
                    Text(coordinator.user.email)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }
                
                // Пароль
                Text("Пароль")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                if isEditing {
                    SecureField("Пароль", text: $coordinator.user.password)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    SecureField("", text: $coordinator.user.password)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .disabled(true)
                }
                
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
                        if isEditing {
                            TextField("ФИО", text: $coordinator.user.phio)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        } else {
                            Text(coordinator.user.phio)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    VStack {
                        Text("Пол")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        if isEditing {
                            Picker("Пол", selection: Binding(
                                get: { coordinator.user.sexIsMan ?? true },
                                set: { coordinator.user.sexIsMan = $0 }
                            )) {
                                Text("Мужской").tag(true)
                                Text("Женский").tag(false)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        } else {
                            if let sex = coordinator.user.sexIsMan {
                                Text(sex ? "Мужской" : "Женский")
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
                }
                
                VStack {
                    Text("Возраст")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                        .padding(.horizontal, 20)
                    if isEditing {
                        TextField("Возраст", text: Binding(
                            get: { coordinator.user.age != nil ? String(coordinator.user.age!) : "" },
                            set: { coordinator.user.age = Int($0) }
                        ))
                        .keyboardType(.numberPad)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    } else {
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
                        if isEditing {
                            TextField("ММР", text: Binding(
                                get: { coordinator.user.mmr != nil ? String(format: "%.0f", coordinator.user.mmr!) : "" },
                                set: { coordinator.user.mmr = Double($0) }
                            ))
                            .keyboardType(.decimalPad)
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        } else {
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
                    }
                    
                    VStack {
                        Text("Рост")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        if isEditing {
                            TextField("Рост", text: Binding(
                                get: { coordinator.user.height != nil ? String(Int(coordinator.user.height!)) : "" },
                                set: { coordinator.user.height = Double($0) }
                            ))
                            .keyboardType(.numberPad)
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        } else {
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
                    }
                    
                    VStack {
                        Text("Вес")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        if isEditing {
                            TextField("Вес", text: Binding(
                                get: { coordinator.user.weight != nil ? String(Int(coordinator.user.weight!)) : "" },
                                set: { coordinator.user.weight = Double($0) }
                            ))
                            .keyboardType(.numberPad)
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        } else {
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
                
                if isEditing {
                    TextEditor(text: Binding(
                        get: { coordinator.user.bio ?? "" },
                        set: { coordinator.user.bio = $0 }
                    ))
                    .font(.system(size: 18))
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5)))
                    .padding(.bottom, 10)
                } else {
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
                }
                
                Spacer()
            }
        }
    }
}
