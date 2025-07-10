import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModelOfRegistration: RegistrationViewModel
    @Binding var isActive: Bool
    
    @State private var isEditing = false
    
    // Локальные @State переменные
    @State private var phio: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var age: String = ""
    @State private var mmr: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bio: String = ""
    @State private var sexIsMan: Bool = true
    
    var body: some View {
        ScrollView {
            VStack {
                // Заголовок и кнопка редактирования
                VStack {
                    HStack {
                        Spacer()
                        Text("Профиль")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.leading, 20)
                        Spacer()
                        Button(action: {
                            isEditing.toggle()
                            if !isEditing {
                                save()
                            }
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                        }
                        .accessibilityIdentifier("EditButton")
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                }

                // Контакты
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
                    TextField("Телефон", text: $phone)
                        .keyboardType(.phonePad)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    Text(phone)
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
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    Text(email)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                Rectangle()
                    .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .frame(height: 1)
                    .padding(.horizontal, 12)

                // Личные данные
                Text("Личные данные")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)

                // ФИО
                Text("ФИО")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                
                if isEditing {
                    TextField("ФИО", text: $phio)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    Text(phio)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                // Пол
                Text("Пол")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)

                if isEditing {
                    Picker("Пол", selection: $sexIsMan) {
                        Text("Мужской").tag(true)
                        Text("Женский").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                } else {
                    Text(sexIsMan ? "Мужской" : "Женский")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                // Возраст
                Text("Возраст")
                    .font(.system(size: 21, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                
                if isEditing {
                    TextField("Возраст", text: $age)
                        .keyboardType(.numberPad)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                } else {
                    Text(age)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                Rectangle()
                    .fill(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .frame(height: 1)
                    .padding(.horizontal, 12)

                // Характеристики
                Text("Характеристики")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)

                HStack {
                    // ММР
                    VStack {
                        Text("ММР")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        
                        if isEditing {
                            TextField("ММР", text: $mmr)
                                .keyboardType(.decimalPad)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        } else {
                            Text(mmr.isEmpty ? "-" : mmr)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                    }

                    // Рост
                    VStack {
                        Text("Рост")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        
                        if isEditing {
                            TextField("Рост", text: $height)
                                .keyboardType(.numberPad)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        } else {
                            Text(height.isEmpty ? "-" : "\(height) см")
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        }
                    }

                    // Вес
                    VStack {
                        Text("Вес")
                            .font(.system(size: 21, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                            .padding(.horizontal, 20)
                        
                        if isEditing {
                            TextField("Вес", text: $weight)
                                .keyboardType(.numberPad)
                                .font(.system(size: 21, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                        } else {
                            Text(weight.isEmpty ? "-" : "\(weight) кг")
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

                // Описание
                Text("Описание")
                    .font(.system(size: 24, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 123/255, green: 123/255, blue: 123/255))
                    .padding(.horizontal, 20)

                if isEditing {
                    TextEditor(text: $bio)
                        .font(.system(size: 18))
                        .frame(height: 100)
                        .padding(.horizontal, 20)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.5)))
                        .padding(.bottom, 10)
                } else {
                    Text(bio.isEmpty ? "Не указано" : bio)
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }

                // Кнопка сохранить
                if isEditing {
                    Button(action: {
                        isEditing = false
                        save()
                    }) {
                        Text("Сохранить")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                    }
                }

                Spacer()

                // Выход из аккаунта
                Button(action: { logout() }) {
                    Text("Выйти из аккаунта")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                }
            }
        }
        .onAppear {
            loadUserData()
        }
    }

    // Загружаем данные пользователя в @State переменные
    func loadUserData() {
        self.phio = coordinator.user.phio
        self.phone = coordinator.user.phone ?? ""
        self.email = coordinator.user.email
        self.age = String(coordinator.user.age ?? 0)
        self.mmr = coordinator.user.mmr.map { String(format: "%.0f", $0) } ?? ""
        self.height = coordinator.user.height.map { String(Int($0)) } ?? ""
        self.weight = coordinator.user.weight.map { String(Int($0)) } ?? ""
        self.bio = coordinator.user.bio ?? ""
        self.sexIsMan = coordinator.user.sexIsMan ?? true
    }

    // Сохраняем данные обратно в модель
    func save() {
        coordinator.user.phio = phio
        coordinator.user.phone = phone
        coordinator.user.email = email
        coordinator.user.age = Int(age) ?? 0
        coordinator.user.mmr = Double(mmr)
        coordinator.user.height = Double(height)
        coordinator.user.weight = Double(weight)
        coordinator.user.bio = bio
        coordinator.user.sexIsMan = sexIsMan

        coordinator.updateUser()
    }

    // Выход
    func logout() {
        UserDefaults.standard.removeObject(forKey: "auth_token")
        isActive = false
        viewModelOfRegistration.token = nil
        viewModelOfRegistration.user = nil
        coordinator.user = User(id: UUID(), phio: "", password: "", email: "", isAdmin: false)
    }
}
