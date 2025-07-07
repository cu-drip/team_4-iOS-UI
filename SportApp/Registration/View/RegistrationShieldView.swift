import SwiftUI

struct RegistrationShieldView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var isAuthenticated: Bool
    
    @State var phio: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    @State var isLogInPressed = false
    
    @State private var isEmailValid: Bool = true

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
                        .frame(width: 406, height: 53)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                TextField(" Электронная почта", text: $email)
                    .padding()
                    .frame(width: 406, height: 53)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                    .autocapitalization(.none)
                    .onChange(of: email) { newValue in
                        isEmailValid = validateEmail(newValue)
                    }
                
                if !isEmailValid {
                    Text("Некорректный email")
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                }
                
                SecureField(" Введите пароль", text: $password)
                    .padding()
                    .frame(width: 406, height: 53)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                
                if isLogInPressed {
                    TextField(" Подтвердите пароль", text: $passwordCheck)
                        .padding()
                        .frame(width: 406, height: 53)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                if !isLogInPressed {
                    Button(action: {
                        isEmailValid = validateEmail(email)
                        if isEmailValid {
                            dismiss()
                        }
                    }, label: {
                        Text("Войти")
                            .frame(width: 166, height: 29)
                            .background(Color.white)
                            .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                            .cornerRadius(22)
                    })
                    .disabled(!isEmailValid)
                } else {
                    Button(action: {
                        isEmailValid = validateEmail(email)
                        if password == passwordCheck && isEmailValid {
                            dismiss()
                        }
                    }, label: {
                        Text("Зарегистрироваться")
                            .frame(width: 192, height: 35)
                            .background(Color.white)
                            .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                            .cornerRadius(22)
                    })
                    .disabled(!isEmailValid)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                if !isLogInPressed {
                    Button(action: {
                        isLogInPressed.toggle()
                    }, label: {
                        if coordinator.user.isAdmin == false {
                            VStack {
                                Text("Вы входите как пользователь")
                                    .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                                HStack {
                                    Text("Нет аккаунта? ")
                                        .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                                    + Text("Зарегистрироваться")
                                        .foregroundColor(Color(red: 47/255, green: 118/255, blue: 250/255))
                                }
                            }
                            .padding()
                        } else {
                            VStack {
                                Text("Вы входите как организатор")
                                    .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                                HStack {
                                    Text("Нет аккаунта? ")
                                        .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                                    + Text("Зарегистрироваться")
                                        .foregroundColor(Color(red: 47/255, green: 118/255, blue: 250/255))
                                }
                            }
                            .padding()
                        }
                    })
                } else {
                    Button(action: {
                        isLogInPressed.toggle()
                    }, label: {
                        HStack {
                            Text("Есть аккаунт? ")
                                .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                            + Text("Войти")
                                .foregroundColor(Color(red: 47/255, green: 118/255, blue: 250/255))
                        }
                    })
                }
            }
        }
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
    }
    
    func dismiss() {
        coordinator.user = User(phio: phio, password: password, email: email, isAdmin: coordinator.user.isAdmin)
        coordinator.dismissSheet()
        isAuthenticated = true
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}
