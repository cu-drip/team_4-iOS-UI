import SwiftUI

struct RegistrationShieldView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var registrationViewModel: RegistrationViewModel
    @Binding var isAuthenticated: Bool
    
    @State var phio: String = ""
    @State var email: String = "GPT@moment.ru"
    @State var password: String = ""
    @State var passwordCheck: String = ""
    @State var isLogInPressed = false
    
    @State private var isEmailValid: Bool = true
    @State var isButtonPressed = false
    @State private var isAnimating = false

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
                        .accessibilityIdentifier("phioField")
                        .padding()
                        .frame(width: 406, height: 53)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                TextField(" Электронная почта", text: $email)
                    .accessibilityIdentifier("emailField")
                    .padding()
                    .frame(width: 406, height: 53)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                    .autocapitalization(.none)
                    .onChange(of: email) { _, newValue in
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
                    .accessibilityIdentifier("passwordField")
                    .padding()
                    .frame(width: 406, height: 53)
                    .background(.white)
                    .cornerRadius(22)
                    .padding(.bottom, 5)
                
                if isLogInPressed {
                    SecureField(" Подтвердите пароль", text: $passwordCheck)
                        .accessibilityIdentifier("passwordCheckField")
                        .padding()
                        .frame(width: 406, height: 53)
                        .background(.white)
                        .cornerRadius(22)
                        .padding(.bottom, 5)
                }
                
                if isButtonPressed {
                    Circle()
                        .trim(from: 0, to: 0.8) // Обрезаем круг для эффекта "полукольца"
                        .stroke(
                            AngularGradient(gradient: Gradient(colors: [.white, .gray, .white]), center: .center),
                            lineWidth: 5
                        )
                        .frame(width: 25, height: 25)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
                
                if !isLogInPressed {
                    Button(action: {
                        isEmailValid = validateEmail(email)
                        if isEmailValid {
                            let user = User(id: UUID(), phio: phio, password: password, email: email, isAdmin: coordinator.user.isAdmin)
                            registrationViewModel.login(user: user)
                            isButtonPressed = true
                        }
                    }, label: {
                        Text("Войти")
                            .frame(width: 166, height: 29)
                            .background(Color.white)
                            .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                            .cornerRadius(22)
                    })
                    .disabled(!isEmailValid || isButtonPressed)
                } else {
                    Button(action: {
                        isEmailValid = validateEmail(email)
                        if password == passwordCheck && isEmailValid {
                            let user = User(id: UUID(), phio: phio, password: password, email: email, isAdmin: coordinator.user.isAdmin)
                            registrationViewModel.register(user: user)
                            isButtonPressed = true
                            //dismiss(user: user)
                        }
                    }, label: {
                        Text("Зарегистрироваться")
                            .accessibilityIdentifier("submitRegistrationButton")
                            .frame(width: 192, height: 35)
                            .background(Color.white)
                            .foregroundColor(Color(red: 25/255, green: 33/255, blue: 38/255))
                            .cornerRadius(22)
                    })
                    .disabled(!isEmailValid || isButtonPressed)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                if !isLogInPressed {
                    Button(action: {
                        isLogInPressed.toggle()
                        isButtonPressed = false
                    }, label: {
                        if coordinator.user.isAdmin == false {
                            VStack {
                                Text("Вы входите как участник")
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
            }.accessibilityIdentifier("registerButton")
        }
        .background(Color(red: 248/255, green: 247/255, blue: 255/255))
        .onChange(of: registrationViewModel.user) { _, _ in
            if let user = registrationViewModel.user {
                dismiss(user: user)
            }
        }
    }
    
    func dismiss(user: User) {
        var user = user
        user.isAdmin = coordinator.user.isAdmin
        coordinator.user = user//User(phio: phio, password: password, email: email, isAdmin: coordinator.user.isAdmin)
        coordinator.dismissSheet()
        isAuthenticated = true
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}
